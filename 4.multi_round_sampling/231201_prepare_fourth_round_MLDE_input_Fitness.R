library(seqinr)
library(tidyverse)
library(ggplot2)
library(readxl)
library(ggrepel)
library(ggsci)
theme_publication<-theme_classic()+
  theme(text = element_text(size=10, family = "Arial"),
        panel.background = element_rect(colour="black", linewidth=0.5),
        legend.position = "bottom",
        strip.background = element_blank())

outdir<-"data/execute_MLDE_benchmark/4th_round_MLDE_input_Fitness_files/"
### SpCas9 ###
### CLADE2.0 in put ###
Fit_norm<-read_csv("data/MLDE_train_test_datasets/SpCas9_fitness_norm.csv")
Fit_norm<- Fit_norm %>% gather(sg, Fitness_n, 2:3)
## input data in Supplementary table S1
Fit<-read_csv("data/execute_MLDE_benchmark/SpCas9_Fitness.csv")
Fit<-left_join(Fit, Fit_norm)
test_sample<-read_csv("data/MLDE_train_test_datasets/SpCas9_test_sample.data")

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SpCas9_Sg5_arDCA_CLADETOPCLADE_georgiev_p2/20230619-223741/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="Sg5") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="Sg5") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SpCas9_Sg5_arDCA_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SpCas9_Sg5_EVarDCA_CLADE2TOPCLADE_georgiev_p2/20230627-145356/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="Sg5") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="Sg5") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SpCas9_Sg5_EVarDCA_CLADE2TOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SpCas9_Sg5_EVmutation_CLADETOPCLADE_georgiev_p2/20230619-223904/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="Sg5") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="Sg5") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SpCas9_Sg5_EVmutation_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SpCas9_Sg8_arDCA_CLADETOPCLADE_georgiev_p2/20230619-224016/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="Sg8") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="Sg8") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SpCas9_Sg8_arDCA_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SpCas9_Sg8_EVarDCA_CLADE2TOPCLADE_georgiev_p2/20230627-145542/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="Sg8") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="Sg8") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SpCas9_Sg8_EVarDCA_CLADE2TOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SpCas9_Sg8_EVmutation_CLADETOPCLADE_georgiev_p2/20230619-224132/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="Sg8") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="Sg8") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SpCas9_Sg8_EVmutation_CLADETOPCLADETOP.csv"))

### SaCas9_1296 
Fit_norm<-read_csv("data/MLDE_train_test_datasets/SaCas9_887888887985986988989991_Fitness_norm.csv")
Fit_norm<- Fit_norm %>% gather(sg, Fitness_n, 2:4)
Fit<-read_csv("data/execute_MLDE_benchmark/execute_2nd_round_MLDE_benchmark/Sa1296_Fitness.csv")
Fit<-left_join(Fit, Fit_norm)
test_sample<-read_csv("data/MLDE_train_test_datasets/SaCas9_887888889985986988989991_fixed_test_set.txt")

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas91296_ACAAGT_arDCA_CLADETOPCLADE_georgiev_p2/20230619-225342/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="ACAAGT") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="ACAAGT") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas91296_ACAAGT_arDCA_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas91296_ACAAGT_EVarDCA_CLADE2TOPCLADE_georgiev_p2/20230627-150441/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="ACAAGT") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="ACAAGT") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas91296_ACAAGT_EVarDCA_CLADE2TOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas91296_ACAAGT_EVmutation_CLADETOPCLADE_georgiev_p2/20230619-225451/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="ACAAGT") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="ACAAGT") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas91296_ACAAGT_EVmutation_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas91296_GGTGGT_arDCA_CLADETOPCLADE_georgiev_p2/20230619-225600/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="GGTGGT") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="GGTGGT") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas91296_GGTGGT_arDCA_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas91296_GGTGGT_EVarDCA_CLADE2TOPCLADE_georgiev_p2/20230627-150559/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="GGTGGT") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="GGTGGT") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas91296_GGTGGT_EVarDCA_CLADE2TOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas91296_GGTGGT_EVmutation_CLADETOPCLADE_georgiev_p2/20230619-225739/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="GGTGGT") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="GGTGGT") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas91296_GGTGGT_EVmutation_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas91296_TGGAGT_arDCA_CLADETOPCLADE_georgiev_p2/20230619-225849/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="TGGAGT") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="TGGAGT") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas91296_TGGAGT_arDCA_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas91296_TGGAGT_EVarDCA_CLADE2TOPCLADE_georgiev_p2/20230627-150708/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="TGGAGT") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="TGGAGT") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas91296_TGGAGT_EVarDCA_CLADE2TOPCLADETOP.csv"))


t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas91296_TGGAGT_EVmutation_CLADETOPCLADE_georgiev_p2/20230619-230003/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="TGGAGT") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="TGGAGT") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas91296_TGGAGT_EVmutation_CLADETOPCLADETOP.csv"))

### Sa8000 ###
Fit_norm<-read_csv("data/MLDE_train_test_datasets/SaCas9_8888889909_Fitness_norm.csv")
Fit_norm<- Fit_norm %>% gather(sg, Fitness_n, 2:5)
Fit<-read_csv("data/execute_MLDE_benchmark/execute_2nd_round_MLDE_benchmark/Sa8000_Fitness.csv")
Fit<-left_join(Fit, Fit_norm)
test_sample<-read_csv("data/MLDE_train_test_datasets/Sa8000_test_sample2.data")

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas98000_DTp56libD18_arDCA_CLADETOPCLADE_georgiev_p2/20230627-145813/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="DTp55libD18") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="DTp56libD18") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas98000_DTp56libD18_arDCA_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas98000_DTp56libD18_EVarDCA_CLADE2TOPCLADE_georgiev_p2/20230627-145928/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="DTp55libD18") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="DTp56libD18") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas98000_DTp56libD18_EVarDCA_CLADE2TOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas98000_DTp56libD18_EVmutation_CLADETOPCLADE_georgiev_p2/20230627-150043/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="DTp55libD18") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="DTp56libD18") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas98000_DTp56libD18_EVmutation_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas98000_DTp58libD21_arDCA_CLADETOPCLADE_georgiev_p2/20230619-225032/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="DTp58libD21") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="DTp58libD21") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas98000_DTp58libD21_arDCA_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas98000_DTp58libD21_EVarDCA_CLADE2TOPCLADE_georgiev_p2/20230627-150336/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="DTp58libD21") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="DTp58libD21") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas98000_DTp58libD21_EVarDCA_CLADE2TOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/SaCas98000_DTp58libD21_EVmutation_CLADETOPCLADE_georgiev_p2/20230619-225133/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit%>% filter(sg=="DTp58libD21") %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(sg=="DTp58libD21") %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "SaCas98000_DTp58libD21_EVmutation_CLADETOPCLADETOP.csv"))

### PhoQ ###
Fit<-read_csv("data/MLDE_train_test_datasets/PhoQ_zeroshot.csv")
Fit<-Fit[, 2:8]
colnames(Fit)[1]<-"AACombo"
test_sample<-read_csv("data/MLDE_train_test_datasets/PhoQ_test_sample.data")
colnames(test_sample)<-c("AACombo", "Fitness", "Fitness_n")

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/PhoQ_arDCA_CLADETOPCLADE_georgiev_p2/20230619-222946/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "PhoQ_arDCA_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/PhoQ_EVarDCA_CLADE2TOPCLADE_georgiev_p2/20230627-145112/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "PhoQ_EVarDCA_CLADE2TOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/PhoQ_EVmutation_CLADETOPCLADE_georgiev_p2/20230619-223052/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "PhoQ_EVmutation_CLADETOPCLADETOP.csv"))

### GFP ###
Fit<-read_csv("data/MLDE_train_test_datasets/GFP_zeroshot.csv")
Fit<-Fit[, 2:8]
colnames(Fit)[1]<-"AACombo"
test_sample<-read_csv("data/MLDE_train_test_datasetsGFP_test_sample.data")

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/GFP_arDCA_CLADETOPCLADE_georgiev_p2/20230619-221010/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o %>% arrange(desc(Fitness)) %>% head(n=48), paste0(outdir, "GFP_arDCA_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/GFP_EVarDCA_CLADE2TOPCLADE_georgiev_p2/20230627-144246/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o %>% arrange(desc(Fitness)) %>% head(n=48), paste0(outdir, "GFP_EVarDCA_CLADE2TOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/GFP_EVmutation_CLADETOPCLADE_georgiev_p2/20230619-221310/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o %>% arrange(desc(Fitness)) %>% head(n=48), paste0(outdir, "GFP_EVmutation_CLADETOPCLADETOP.csv"))

### PABP ###
Fit<-read_csv("data/MLDE_train_test_datasets/PABP_zeroshot.csv")
Fit<-Fit[, 2:8]
colnames(Fit)[1]<-"AACombo"
test_sample<-read_csv("data/MLDE_train_test_datasets/PABP_test_sample.data")

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/PABP_arDCA_CLADETOPCLADE_georgiev_p2/20230619-221627/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "PABP_arDCA_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/PABP_EVarDCA_CLADE2TOPCLADE_georgiev_p2/20230627-144537/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% head(n=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "PABP_EVarDCA_CLADE2TOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/PABP_EVmutation_CLADETOPCLADE_georgiev_p2/20230619-221856/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "PABP_EVmutation_CLADETOPCLADETOP.csv"))

### UBE ###
Fit<-read_csv("data/MLDE_train_test_datasets/UBE_zeroshot.csv")
Fit<-Fit[, 2:8]
colnames(Fit)[1]<-"AACombo"
test_sample<-read_csv("data/MLDE_train_test_datasets/UBE_test_sample.data")

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/UBE_arDCA_CLADETOPCLADE_georgiev_p2/20230619-222204/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "UBE_arDCA_CLADETOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/UBE_EVarDCA_CLADE2TOPCLADE_georgiev_p2/20230627-144853/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o, paste0(outdir, "UBE_EVarDCA_CLADE2TOPCLADETOP.csv"))

t<-read_csv("data/execute_MLDE_benchmark/execute_3rd_round_MLDE_benchmark/UBE_EVmutation_CLADETOPCLADE_georgiev_p2/20230619-222430/PredictedFitness.csv")
training_variants<- t %>% filter(`InTrainingData?`=="YES") %>% select(AACombo) %>% unlist()
t<-t %>% filter(`InTrainingData?`=="NO") %>% filter(!AACombo %in% test_sample)
t<-left_join(t, Fit %>% select(AACombo, cluster_id, Fitness_n))
t<-t %>% filter(!is.na(Fitness_n)) %>% mutate(rank_p=rank(-PredictedFitness, ties.method = "min"))
nxt_v<-t %>% filter(rank_p<=12) %>% select(AACombo) %>% unlist()
o<- Fit %>% filter(AACombo %in% c(training_variants, nxt_v)) %>% select(AACombo, Fitness_n)
colnames(o)<-c("AACombo", "Fitness")
write_csv(o %>% arrange(desc(Fitness)) %>% head(n=48), paste0(outdir, "UBE_EVmutation_CLADETOPCLADETOP.csv"))
