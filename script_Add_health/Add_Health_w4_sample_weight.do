/**************************************************************************
 |                                                                         
 |                    STATA SETUP FILE FOR ICPSR 21600
 |         NATIONAL LONGITUDINAL STUDY OF ADOLESCENT HEALTH (ADD
 |                           HEALTH), 1994-2008
 |          (DATASET 0029: WAVE IV, GRAND SAMPLE WEIGHTS, PUBLIC
 |                               USE DATA)
 |
 |
 |  Please edit this file as instructed below.
 |  To execute, start Stata, change to the directory containing:
 |       - this do file
 |       - the ASCII data file
 |       - the dictionary file
 |
 |  Then execute the do file (e.g., do 21600-0029-statasetup.do)
 |
 **************************************************************************/

set mem 6m  /* Allocating 6 megabyte(s) of RAM for Stata SE to read the
                 data file into memory. */


set more off  /* This prevents the Stata output viewer from pausing the
                 process */

/****************************************************

Section 1: File Specifications
   This section assigns local macros to the necessary files.
   Please edit:
        "data-filename" ==> The name of data file downloaded from ICPSR
        "dictionary-filename" ==> The name of the dictionary file downloaded.
        "stata-datafile" ==> The name you wish to call your Stata data file.

   Note:  We assume that the raw data, dictionary, and setup (this do file) all
          reside in the same directory (or folder).  If that is not the case
          you will need to include paths as well as filenames in the macros.

********************************************************/


/********************************************************

Section 2: Infile Command

This section reads the raw data into Stata format.  If Section 1 was defined
properly, there should be no reason to modify this section.  These macros
should inflate automatically.

**********************************************************/

infile using "D:\Dropbox\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w4_sample_weights\DS0029\21600-0029-Setup.dct", using ("D:\Dropbox\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w4_sample_weights\DS0029\21600-0029-Data.txt") clear


label data "National Longitudinal Study of Adolescent Health (Add Health), 1994-2008, Wave IV, Grand Sample Weights, Public Use Data"

#delimit ;


#delimit cr

/********************************************************************

 Section 3: Save Outfile

  This section saves out a Stata system format file.  There is no reason to
  modify it if the macros in Section 1 were specified correctly.

*********************************************************************/

save "D:\Dropbox\J file\dissertation\Add_health_data\temp_data\w4_sample_weight", replace

