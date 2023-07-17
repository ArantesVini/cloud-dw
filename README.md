# Cloud DataWarehouse

## Project Overview

The TechFab Data Warehouse project aims to build a cloud data warehouse using Terraform, AWS S3 and AWS Redshift for TechFab S.A., a fictional industrial company. The data warehouse will enable data-driven decision-making across various sectors such as production, sales, suppliers, finance, maintenance, and quality. By leveraging the power of a data warehouse, TechFab S.A. aims to enhance operational efficiency, identify growth opportunities, and drive the company's success.

## Architeture Explanaition

The data to load in DW are in a AWS S3 bucket, in a folder with the name `data`;

## Objective

Apply basically the same Data Warehouse in my on-premises project, techfab-dw, but in the AWS Cloud, using Terraform as IaC.

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

- D_TIME;
- D_PRODUCT;
- D_LOCALE;
- D_CUSTOMER.

#### Fact Table

- F_SALES;

## Usage instructions

## About the project

All the data used in this project are fictional, for practice and research purposes only.

This project is made by part of the course "Design e Implementação de Data Warehouses" avaliable at https://www.datascienceacademy.com.br/

## License

This project is licensed under the MIT License - see the [MIT LICENSE](LICENSE) file for details.
