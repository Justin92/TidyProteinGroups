
###ProteinGroups Tidying 

###Input:





ProteinGroups <- read.delim("D:/Projects/HumanBrainNoRawFiles/12_Fractions_20171201/proteinGroups.txt", stringsAsFactors = F)

ProteinGroupsLFQ <- select(ProteinGroups, Protein.IDs, Majority.protein.IDs, LFQ.intensity.146_Amygdala:LFQ.intensity.405_VisualCortex)

ProteinGroupsLFQ <- mutate(ProteinGroupsLFQ, Case_Section = gsub("^.*?y.", "", Case_Section))
ProteinGroupsLFQ <- gather(ProteinGroupsLFQ_Perm, Case_Section, LFQ_Intensity, LFQ.intensity.146_Amygdala:LFQ.intensity.405_VisualCortex)

ProteinGroupsLFQ <- mutate(ProteinGroupsLFQ, Case_Section = gsub("^.*?y.", "", Case_Section))

ProteinGroupsLFQ <- separate(ProteinGroupsLFQ, Case_Section, c("Case", "Section"))

ProteinGroupsLFQ <- select(ProteinGroupsLFQ, Majority.protein.IDs:LFQ_Intensity)

for(i in 1:nrow(ProteinGroupsLFQ)){TempList <- strsplit(ProteinGroupsLFQ$Majority.protein.IDs[i], ";")
ProteinGroupsLFQ$Majority.protein.IDs[i] <- TempList[[1]][1]}

ProteinGroupsLFQ <- spread(ProteinGroupsLFQ, Majority.protein.IDs, LFQ_Intensity)