data {
  int<lower=0> N; // number of trials
  array[N] int<lower=0,upper=1> y; // discrete choice 
  array[N] real <lower = 0, upper = 1> Source1; // own source
  array[N] real <lower = 0, upper = 1> Source2; // other source 
}

transformed data {
  array[N] real l_Source1; // array of len N with logit of Source1
  array[N] real l_Source2; // array of len N with logit of Source2
  l_Source1 = logit(Source1); // logit of Source1
  l_Source2 = logit(Source2); // logit of Source2
}

parameters {
  real bias; // bias param
  // meaningful weights are btw 0.5 and 1 (theory reasons)
  real<lower = 0.5, upper = 1> w1; // weight for own source real number between 0.5 and 1
  real<lower = 0.5, upper = 1> w2; // weight for other source real number between 0.5 and 1
}

transformed parameters {
  real<lower = 0, upper = 1> weight1; // weight for own source
  real<lower = 0, upper = 1> weight2; // weight for other source
  // weight parameters are rescaled to be on a 0-1 scale (0 -> no effects; 1 -> face value)
  weight1 = (w1 - 0.5) * 2;  // rescale weight1
  weight2 = (w2 - 0.5) * 2;  // rescale weight2 
}

model {
  
  target += normal_lpdf(bias | 0, 1); // prior for bias 
  target += beta_lpdf(weight1 | 1, 1); // prior for weight1 -> uniform prior
  target += beta_lpdf(weight2 | 1, 1); // prior for weight2 -> uniform prior
  
  for (n in 1:N)
    target += bernoulli_logit_lpmf(y[n] | bias + weight1 * l_Source1[n] + weight2 * l_Source2[n]);
}

//generated quantities{
//  array[N] real log_lik; // array of len N with log likelihood
//  real bias_prior; // prior for bias
//  real w1_prior; // prior for weight1
//  real w2_prior; // prior for weight2
//  bias_prior = normal_rng(0, 1) ; // sample from prior for bias
//  w1_prior = 0.5 + inv_logit(normal_rng(0, 1))/2 ; // sample from prior for weight1
//  w2_prior = 0.5 + inv_logit(normal_rng(0, 1))/2 ; // sample from prior for weight2
//  for (n in 1:N)
//    log_lik[n]= bernoulli_logit_lpmf(y[n] | bias + weight1 * l_Source1[n] + weight2 * l_Source2[n]);
//}


generated quantities{
  array[N] real log_lik; // array of len N with log likelihood
  real bias_prior; // prior for bias
  real w1_prior; // prior for weight1
  real w2_prior; // prior for weight2
  real posterior_log_lik; // log likelihood for the entire dataset
  
  bias_prior = normal_rng(0, 1); // sample from prior for bias
  w1_prior = 0.5 + inv_logit(normal_rng(0, 1))/2; // sample from prior for weight1
  w2_prior = 0.5 + inv_logit(normal_rng(0, 1))/2; // sample from prior for weight2

  posterior_log_lik = 0; // initialize the accumulator
  for (n in 1:N) {
    log_lik[n] = bernoulli_logit_lpmf(y[n] | bias + weight1 * l_Source1[n] + weight2 * l_Source2[n]);
    posterior_log_lik += log_lik[n]; // accumulate log likelihoods
  }
}
