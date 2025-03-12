DROP  TABLE  tbl_catalog_exception_customer_rel;
DROP  TABLE  tbl_catalog_exception_override_details;
DROP  TABLE  tbl_catalog_exception_item;
DROP  TABLE  tbl_catalog_exception;


CREATE TABLE tbl_catalog_exception
(
    id                 VARCHAR(255) PRIMARY KEY,
    exception_for      VARCHAR(255),
    division_id        VARCHAR(255),
    parent_division_id VARCHAR(255),
    currency           VARCHAR(100),
    tenant_id          BIGINT   DEFAULT 1,
    is_deleted         BOOLEAN  DEFAULT FALSE,
    createdate         DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    exception_name VARCHAR(255),
    createdbyid        BIGINT,
    description VARCHAR(255),
    status VARCHAR(255),
    lastmodifiedbyid   BIGINT
);

CREATE TABLE tbl_catalog_exception_item
(
    id                        VARCHAR(255) PRIMARY KEY,
    item_id                   VARCHAR(255),
    uom                       VARCHAR(255),
    cost                      DOUBLE,
    allow_std_price           VARCHAR(255),
    allow_multiple_shelf_life VARCHAR(255),
    catalog_exception_id      VARCHAR(255),
    end_date   DATE,
    start_date   DATE,
    is_deleted  BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (catalog_exception_id) REFERENCES tbl_catalog_exception (id)
);

CREATE TABLE tbl_catalog_exception_override_details
(
    id                       VARCHAR(255) PRIMARY KEY,
    line_type                VARCHAR(255),
    is_primary               BOOLEAN DEFAULT FALSE,
    shelf_life               VARCHAR(255),
    std_price_type           VARCHAR(255),
    std_price_value          DOUBLE,
    final_std_price          DOUBLE,
    max_price_type           VARCHAR(255),
    max_price_value          DOUBLE,
    final_max_price          DOUBLE,
    limit_max_quantity_type  VARCHAR(255),
    limit_max_quantity_value DOUBLE,
    stock_on_hand            DOUBLE,
    consumed_stock           DOUBLE,
    catalog_exception_item_id     VARCHAR(255),
    uom VARCHAR(255),
    cost DOUBLE,
    FOREIGN KEY (catalog_exception_item_id) REFERENCES tbl_catalog_exception_item (id)
);

CREATE TABLE tbl_catalog_exception_customer_rel
(
    id                   VARCHAR(255) PRIMARY KEY,
    catalog_exception_id VARCHAR(255),
    customer_id          VARCHAR(255),
    name_en              VARCHAR(255),
    name_ar              VARCHAR(255),
    tenant_id            BIGINT  DEFAULT 1,
    is_deleted           BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (catalog_exception_id) REFERENCES tbl_catalog_exception (id),
    number VARCHAR(36)
);
