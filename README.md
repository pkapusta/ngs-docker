# ngs-docker

## Usage
Create  image:
```
docker build -t nuada/ngs .
```

Create container:
```
mkdir tmp
chmod 1777 tmp
docker run -it --name ngs \
	--volume=/data:/data \
	--volume=/rawdata:/rawdata \
	--volume=/resources:/resources \
	--volume=$(pwd)/tmp:/tmp \
	nuada/ngs
```

Add SSH key to container:
```
docker exec -i ngs bash -c 'cat > /home/<your_user_name>/.ssh/id_rsa' < ~/.ssh/id_rsa
```

Update/install GEMINI annotation data:
```
/usr/bin/update-gemini-data
```

## Resources
This container assumes special layout of `/resources` directory for every reference (hg19 and b37):

- Reference genome

```
/resources/hg19
/resources/hg19/ucsc.hg19.fasta
/resources/hg19/ucsc.hg19.fasta.fai
/resources/hg19/ucsc.hg19.fasta.pureseq
/resources/hg19/ucsc.hg19.fasta.seqlen
/resources/hg19/ucsc.hg19.genome
```

- Aligner indices - BWA index is version because of incompatibilites between 0.5.x and 0.7.x

```
/resources/hg19/bowtie2
/resources/hg19/bowtie2/ucsc.hg19.1.bt2
/resources/hg19/bowtie2/ucsc.hg19.2.bt2
/resources/hg19/bowtie2/ucsc.hg19.3.bt2
/resources/hg19/bowtie2/ucsc.hg19.4.bt2
/resources/hg19/bowtie2/ucsc.hg19.fa
/resources/hg19/bowtie2/ucsc.hg19.gtf
/resources/hg19/bowtie2/ucsc.hg19.rev.1.bt2
/resources/hg19/bowtie2/ucsc.hg19.rev.2.bt2
/resources/hg19/bwa
/resources/hg19/bwa/0.7.5
/resources/hg19/bwa/0.7.5/ucsc.hg19.fasta
/resources/hg19/bwa/0.7.5/ucsc.hg19.fasta.amb
/resources/hg19/bwa/0.7.5/ucsc.hg19.fasta.ann
/resources/hg19/bwa/0.7.5/ucsc.hg19.fasta.bwt
/resources/hg19/bwa/0.7.5/ucsc.hg19.fasta.fai
/resources/hg19/bwa/0.7.5/ucsc.hg19.fasta.pac
/resources/hg19/bwa/0.7.5/ucsc.hg19.fasta.sa
```

- [GATK resource bundle](https://www.broadinstitute.org/gatk/guide/article.php?id=1215)

```
/resources/hg19/GATK
/resources/hg19/GATK/1000G_omni2.5.hg19.vcf
/resources/hg19/GATK/1000G_omni2.5.hg19.vcf.idx
/resources/hg19/GATK/1000G_phase1.indels.hg19.vcf
/resources/hg19/GATK/1000G_phase1.indels.hg19.vcf.idx
/resources/hg19/GATK/1000G_phase1.snps.high_confidence.hg19.vcf
/resources/hg19/GATK/1000G_phase1.snps.high_confidence.hg19.vcf.idx
/resources/hg19/GATK/dbsnp_137.hg19.excluding_sites_after_129.vcf
/resources/hg19/GATK/dbsnp_137.hg19.excluding_sites_after_129.vcf.idx
/resources/hg19/GATK/dbsnp_137.hg19.vcf
/resources/hg19/GATK/dbsnp_137.hg19.vcf.idx
/resources/hg19/GATK/hapmap_3.3.hg19.vcf
/resources/hg19/GATK/hapmap_3.3.hg19.vcf.idx
/resources/hg19/GATK/Mills_and_1000G_gold_standard.indels.hg19.vcf
/resources/hg19/GATK/Mills_and_1000G_gold_standard.indels.hg19.vcf.idx
/resources/hg19/ucsc.hg19.dict
```

- [SnpEff](http://snpeff.sourceforge.net/) version 3.6 (snpEff.config
  `data_dir` must point to `/resources/snpEff/3.6`)

```
/resources/software/snpEff-3.6/
```

- SnpEff databases

```
/resources/snpEff/3.6/GRCh37.75
/resources/snpEff/3.6/hg19
```
