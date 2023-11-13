# RNA-seq
The provided set of bash scripts constitutes a comprehensive RNA-seq analysis workflow, facilitating the processing and analysis of high-throughput sequencing data. Beginning with quality control and trimming using Trimmomatic, the scripts progress to format conversion via gffread, followed by indexing of the genome using HISAT2 or STAR aligners. Alignment of trimmed reads is conducted using HISAT2 or STAR separately. Subsequent steps involve the conversion of SAM to BAM, sorting, and indexing using samtools. The workflow concludes with feature counting using featureCounts, yielding gene-level expression information. These scripts collectively serve as a robust pipeline for researchers conducting RNA-seq experiments, providing a structured and automated approach to handle raw data, align reads to a reference genome, and extract essential quantitative information about gene expression levels. This pipeline is versatile, allowing customization for different organisms and experimental designs, making it a valuable resource for scientists engaged in transcriptome analysis.
Let's go through each script and tool used:

### 1. Trimmomatic Script (`1-Trimmomatic_QC.sh`)

- **Purpose:** Quality control and trimming of raw sequencing reads.

- **Tools Used:**
  - `trimmomatic`: A tool for trimming and filtering of Illumina sequencing data.

- **Steps:**
  1. Set up paths and directories.
  2. Create output directories for trimmed paired and unpaired reads.
  3. Iterate over raw sequencing files and perform trimming using Trimmomatic.
  4. Create a QC directory, run FastQC on the trimmed paired reads, and generate a multiQC report.

### 2. GFFRead Script (`2-Convertgff.sh`)

- **Purpose:** Convert GFF (General Feature Format) to GTF (Gene Transfer Format).

- **Tools Used:**
  - `gffread`: A tool for converting GFF3 to GTF.

- **Steps:**
  1. Set up paths and directories.
  2. Use `gffread` to convert the GFF file to GTF format.

### 3. HISAT2 Indexing Script (`3-GenomeIndexHISAT2.sh`)

- **Purpose:** Indexing the genome for HISAT2 alignment.

- **Tools Used:**
  - `hisat2`: A fast and sensitive alignment program for mapping next-generation sequencing reads to a population of genomes.

- **Steps:**
  1. Set up paths and directories.
  2. Extract exons and splice sites from the GTF file.
  3. Build the HISAT2 index using extracted exons and splice sites.

### 4. STAR Indexing Script (`3-GenomeIndexSATR.sh`)

- **Purpose:** Indexing the genome for STAR alignment.

- **Tools Used:**
  - `STAR`: A high-performance RNA-seq aligner.

- **Steps:**
  1. Set up paths and directories.
  2. Run STAR to generate the genome index.

### 5. HISAT2 Alignment Script (`4-HISAT2_Align.sh`)

- **Purpose:** Perform alignment of trimmed reads using HISAT2.

- **Tools Used:**
  - `hisat2`: For read alignment.

- **Steps:**
  1. Set up paths and directories.
  2. Iterate over trimmed reads and perform HISAT2 alignment.

### 6. STAR Alignment Script (`4-STAR_Align.sh`)

- **Purpose:** Perform alignment of trimmed reads using STAR.

- **Tools Used:**
  - `STAR`: For read alignment.

- **Steps:**
  1. Set up paths and directories.
  2. Iterate over trimmed reads and perform STAR alignment.

### 7. SAM to BAM Conversion and Sorting Script (`5-sam-to-bam.sh`)

- **Purpose:** Convert SAM files to BAM files, sort them, and index the sorted BAM files.

- **Tools Used:**
  - `samtools`: Utilities for interacting with and manipulating SAM/BAM/CRAM format files.

- **Steps:**
  1. Set up paths and directories.
  2. Iterate over SAM files, convert to BAM, sort, and index.

### 8. FeatureCounts Script (`6-featureCounts.sh`)

- **Purpose:** Perform feature counting on the aligned reads.

- **Tools Used:**
  - `featureCounts`: A tool for counting reads in features such as genes, exons, and more.

- **Steps:**
  1. Set up paths and directories.
  2. Iterate over sorted BAM files and perform feature counting.
  3. Extract counts and save to a separate file.
