# TaBSAP
## Targeted Bisulfite Sequencing Analysis Pipeline

## User Guide - v0.0.2
A pipeline to analyze the data obtained from targeted bisulfite sequencing through the ion-torrent platform.

TaBSAP is a pipeline to map bisulfite treated sequencing reads to a genome of interest and perform methylation calls in a single step and enables a researcher to analyze the methylation levels of their samples straight away. It's main features are:

-Bisulfite mapping and methylation calling in one single step

-Supports single-end read alignments

-Alignment seed length, number of mismatches etc. are adjustable

-The output gives heatmap with categories.


### Minimum System Requirements

#### Project Name: TaBS-Pipe


#### Project Homepage: https://github.com/pradyumnasagar/TaBSAP


#### Operating System: 64 bit Unix-like OS/ Linux Distributions(Ubuntu, CentOS, RHEL,etc.),Windows (with cygwin and R in cygwin).


#### Programming Language: SHELL Scripting.


#### Recommended System Requirement: 4GB RAM, 64 bit unix/linux OS.


#### Other Requirements: R, Pheatmap package for R,fastx toolkit(for 32 bit System ), Dos2Unix.


#### License: MIT License.

## Installation:

### 1) Install the requirements
#### installing requirements:
#### Ubuntu
`sudo apt-get update`

`sudo apt-get install gcc make libbz2-dev zlib1g-dev libncurses5-dev libncursesw5-dev liblzma-dev`

`sudo apt-get install dos2unix rename fastqc samtools fastx-toolkit`

### 2) Download the pipeline or clone the Pipeline in your Linux system with git


Open Terminal


#### To download

`wget https://github.com/pradyumnasagar/TaBSAP/archive/v1.0.2.zip`

`unzip v1.0.2.zip`

`cd v1.0.2`

#### To Clone

`git clone https://github.com/pradyumnasagar/TaBSAP.git`

`cd TaBSAP`

### 3) Copy all the fastq files to `fastq` folder and Unconverted reference to `reference` folder

### 4) Run the pipeline and follow the `ON-Screen Instructions`

`./start.sh`
