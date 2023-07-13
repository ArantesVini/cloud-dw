CREATE SCHEMA IF NOT EXISTS dsaschema;

CREATE TABLE IF NOT EXISTS dsaschema.d_customer (
    sk_customer integer NOT NULL,
    id_customer integer NOT NULL,
    name_customer character varying(50) NOT NULL,
    type_customer character varying(50),
    CONSTRAINT d_customer_pkey PRIMARY KEY (sk_customer)
);

CREATE TABLE IF NOT EXISTS dsaschema.d_locale (
    sk_locale integer NOT NULL,
    id_locale integer NOT NULL,
    country_locale character varying(50) NOT NULL,
    region_locale character varying(50) NOT NULL,
    state_locale character varying(50) NOT NULL,
    city_locale character varying(50) NOT NULL,
    CONSTRAINT d_locale_pkey PRIMARY KEY (sk_locale)
);

CREATE TABLE IF NOT EXISTS dsaschema.d_product (
    sk_product integer NOT NULL,
    id_product integer NOT NULL,
    name_product character varying(50) NOT NULL,
    category_product character varying(50) NOT NULL,
    subcategory_product character varying(50) NOT NULL,
    CONSTRAINT d_product_pkey PRIMARY KEY (sk_product)
);

CREATE TABLE IF NOT EXISTS dsaschema.d_time (
    sk_time integer NOT NULL,
    fulldate_time date,
    year_time integer NOT NULL,
    month_time integer NOT NULL,
    day_time integer NOT NULL,
    CONSTRAINT d_time_pkey PRIMARY KEY (sk_time)
);

CREATE TABLE IF NOT EXISTS dsaschema.fact_sales (
    sk_product integer NOT NULL,
    sk_customer integer NOT NULL,
    sk_locale integer NOT NULL,
    sk_time integer NOT NULL,
    quantity integer NOT NULL,
    sale_price numeric(10, 2) NOT NULL,
    product_cost numeric(10, 2) NOT NULL,
    sales_revenue numeric(10, 2) NOT NULL,
    CONSTRAINT fact_sales_pkey PRIMARY KEY (sk_product, sk_customer, sk_locale, sk_time),
    CONSTRAINT fact_sales_sk_customer_fkey FOREIGN KEY (sk_customer) REFERENCES dsaschema.d_customer (sk_customer),
    CONSTRAINT fact_sales_sk_locale_fkey FOREIGN KEY (sk_locale) REFERENCES dsaschema.d_locale (sk_locale),
    CONSTRAINT fact_sales_sk_product_fkey FOREIGN KEY (sk_product) REFERENCES dsaschema.d_product (sk_product),
    CONSTRAINT fact_sales_sk_time_fkey FOREIGN KEY (sk_time) REFERENCES dsaschema.d_time (sk_time)
);

COPY dsaschema.d_customer
FROM
    's3://dsa-cloud-dw-20230713/data/d_customer.csv' IAM_ROLE 'arn:aws:iam::890582101704:role/RedshiftS3AccessRole' CSV;

COPY dsaschema.d_locale
FROM
    's3://dsa-cloud-dw-20230713/data/d_locale.csv' IAM_ROLE 'arn:aws:iam::890582101704:role/RedshiftS3AccessRole' CSV;

COPY dsaschema.d_product
FROM
    's3://dsa-cloud-dw-20230713/data/d_product.csv' IAM_ROLE 'arn:aws:iam::890582101704:role/RedshiftS3AccessRole' CSV;

COPY dsaschema.d_time
FROM
    's3://dsa-cloud-dw-20230713/data/d_time.csv' IAM_ROLE 'arn:aws:iam::890582101704:role/RedshiftS3AccessRole' CSV;

COPY dsaschema.fact_sales
FROM
    's3://dsa-cloud-dw-20230713/data/fact_sales.csv' IAM_ROLE 'arn:aws:iam::890582101704:role/RedshiftS3AccessRole' CSV;