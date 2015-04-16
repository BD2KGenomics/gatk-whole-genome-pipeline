cd /ephemeral/mnt

# get NA12878 from 1000g from BD2K's s3
~/s3cmd/s3cmd get \
    --secret_key=${SECRET_KEY} \
    --access_key=${ACCESS_KEY} \
    s3://bd2k-test-data/NA12878.mapped.ILLUMINA.bwa.CEU.high_coverage_pcr_free.20130906.bam
mv NA12878.mapped.ILLUMINA.bwa.CEU.high_coverage_pcr_free.20130906.bam NA12878.bam

#get reference genome
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/2.5/b37/human_g1k_v37_decoy.fasta.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/2.5/b37/human_g1k_v37_decoy.fasta.fai.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/2.5/b37/human_g1k_v37_decoy.dict.gz
gunzip human_g1k_v37_decoy.fasta
gunzip human_g1k_v37_decoy.fasta.fai 
gunzip human_g1k_v37_decoy.dict.gz

# VCF files for VariantRecalibrator_INDEL.RealignerTargetCreator knowns, and dbsnp for BaseRecalibraton
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/2.5/b37/Mills_and_1000G_gold_standard.indels.b37.vcf.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/2.5/b37/1000G_phase1.indels.b37.vcf.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/2.5/b37/dbsnp_137.b37.vcf.gz
gunzip Mills_and_1000G_gold_standard.indels.b37.vcf.gz
gunzip 1000G_phase1.indels.b37.vcf.gz
gunzip dbsnp_137.b37.vcf.gz

#Resource files for VariantRecalibrator_SNP
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/2.5/b37/hapmap_3.3.b37.vcf.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/2.5/b37/1000G_omni2.5.b37.vcf.gz
wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/2.5/b37/1000G_phase1.snps.high_confidence.b37.vcf.gz
gunzip hapmap_3.3.b37.vcf.gz
gunzip 1000G_omni2.5.b37.vcf.gz
gunzip 1000G_phase1.snps.high_confidence.b37.vcf.gz


cd ~
#TOOLS
# get/install samtools
sudo apt-get install zlib1g-dev
sudo apt-get install samtools

# get/install picard
wget https://github.com/broadinstitute/picard/releases/download/1.130/picard-tools-1.130.zip
unzip picard-tools-1.130.zip

# get GATK.jar
wget https://s3-us-west-2.amazonaws.com/bd2k-artifacts/10k-exomes/GenomeAnalysisTK.jar