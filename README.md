# Cloud DataWarehouse

## Project Overview

## Architeture Explanaition

The data to load in DW are in a AWS S3 bucket, in a folder with the name `data`;

## Objective

## Pre requisites
- Terraform;
- PSQL;
- AWS Account;
- AWS CLI.

## Repository Structure

- `terraform` - Scripts to apply IoC in AWS;
    - `s3` - Creation of S3 bucket and load the data;
    - `tf_config` - IoC of Redshift and IAM roles.
- `sql` - SQL scripts to DW initial load, taking data from the S3 bucket and load in the redshift cluster.

## Project Objective

## DataWarehouse modelling

#### Dimensions Tables

#### Fact Table

## Usage instructions

## About the project

All the data used in this project are fictional, for practice and research purposes only.

This project is made by part of the course "Design e Implementação de Data Warehouses" avaliable at https://www.datascienceacademy.com.br/

## License

This project is licensed under the MIT License - see the [MIT LICENSE](LICENSE) file for details.
