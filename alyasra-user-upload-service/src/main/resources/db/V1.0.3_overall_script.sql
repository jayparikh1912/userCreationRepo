CREATE TABLE tblcommonlist
(
    `list_item_id` bigint NOT NULL AUTO_INCREMENT,
    `status`       varchar(255),
    `tenant_id`    bigint  DEFAULT 1,
    `list_text`    varchar(255),
    `list_type`    varchar(40),
    `list_value`   varchar(255),
    `is_deleted`   boolean default false,
    PRIMARY KEY (`list_item_id`)
);

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (1, 'Active', 'Fix Value', 'priceType', 'Fix Value');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (2, 'Active', 'Fix Value On Cost', 'priceType', 'Fix Value On Cost');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (3, 'Active', '% On Cost', 'priceType', '% On Cost');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (4, 'Active', 'Fix Value', 'qtyType', 'Fix Value');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (5, 'Active', '% Of Stock', 'qtyType', '% Of Stock');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (6, 'Active', 'Active', 'status', 'Active');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (7, 'Active', 'Inactive', 'status', 'Inactive');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (8, 'Active', 'Customer', 'forWhom', 'Customer');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (9, 'Active', 'Work Unit', 'forWhom', 'Work Unit');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (10, 'Active', 'KD', 'currency', 'KD');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (11, 'Active', 'Yes', 'flag', 'Yes');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (12, 'Active', 'No', 'flag', 'No');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (13, 'Active', 'Liquidation', 'lineType', 'Liquidation');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (14, 'Active', 'Different Shelf Life', 'lineType', 'Different Shelf Life');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (15, 'Active', 'Header', 'promotionType', 'Header');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (16, 'Active', 'Line', 'promotionType', 'Line');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (17, 'Active', 'Fixed Percentage', 'Header', 'Fixed Percentage');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (18, 'Active', 'Buy X Get Y', 'Line', 'Buy X Get Y');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (19, 'Active', 'Discounted Price', 'Line', 'Discounted Price');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (20, 'Active', 'Volume Based Discount', 'Line', 'Volume Based Discount');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (21, 'Active', 'Draft', 'approvalStatus', 'Draft');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (22, 'Active', 'Pending Approval', 'approvalStatus', 'Pending Approval');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (23, 'Active', 'Approved', 'approvalStatus', 'Approved');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (24, 'Active', 'Rejected', 'approvalStatus', 'Rejected');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (25, 'Active', 'Action Required', 'approvalStatus', 'Action Required');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (26, 'Active', 'Legal Document', 'docType', 'Legal Document');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (27, 'Active', 'Signatory Letter', 'docType', 'Signatory Letter');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (28, 'Active', 'Bank Details', 'docType', 'Bank Details');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (29, 'Active', 'Terms and Conditions', 'docType', 'Terms and Conditions');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (30, 'Active', 'Quote', 'customPricingType', 'Quote');

INSERT INTO tblcommonlist
(list_item_id, status, list_text, list_type, list_value)
VALUES (31, 'Active', 'Contract', 'customPricingType', 'Contract');



CREATE TABLE tbl_scheduler_config
(
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(255),
    cron_expression VARCHAR(255),
    is_deleted      BOOLEAN DEFAULT FALSE,
    status          VARCHAR(255),
    scheduled_time  TIMESTAMP
);

INSERT INTO tbl_scheduler_config (name, cron_expression, is_deleted, status, scheduled_time)
VALUES ('INACTIVE_PROMOTION_JOB', '0 0 * * * *', false, 'ACTIVE', NOW());

CREATE TABLE tbl_divisions
(
    id                 VARCHAR(255) PRIMARY KEY,
    name_en            VARCHAR(255),
    name_ar            VARCHAR(255),
    parent_division_id VARCHAR(255),
    is_deleted         BOOLEAN  DEFAULT FALSE,
    createdate         DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);

INSERT INTO tbl_divisions (id, name_en, name_ar, parent_division_id, is_deleted, createdate, lastmodifieddate,
                           createbyname, lastmodifiedbyname, createdbyid, lastmodifiedbyid)
VALUES ('1e3f7c8a-5e7c-47c1-9f3b-ebf976b026a4', 'Restaurant DDR', 'Restaurant DDR',
        '7d8c6ad1-3d45-47ef-a56e-c50e38329885', 0, '2024-04-12 16:32:05', '2024-04-12 16:32:05', 'Admin Admin',
        'Admin Admin', 1, 1),
       ('1f7c1e3d-a4c9-4c12-89f0-f7bc964b89b0', 'Horeca - 4PL', 'Horeca - 4PL', '8d1e8eb9-c1a5-4b9a-98ad-b5e61a2d3f21',
        0, '2024-04-12 16:32:05', '2024-04-12 16:32:05', 'Admin Admin', 'Admin Admin', 1, 1),
       ('2d3f6b8c-6e8f-46d3-9f81-9d6bd3b16b5e', 'Restaurant (South)', 'Restaurant (South)',
        '7d8c6ad1-3d45-47ef-a56e-c50e38329885', 0, '2024-04-12 16:32:05', '2024-04-12 16:32:05', 'Admin Admin',
        'Admin Admin', 1, 1),
       ('3f5d2d65-2e3e-4db5-9b7e-59ddc2e8b9e1', 'Restaurant (North)', 'Restaurant (North)',
        '7d8c6ad1-3d45-47ef-a56e-c50e38329885', 0, '2024-04-12 16:32:05', '2024-04-12 16:32:05', 'Admin Admin',
        'Admin Admin', 1, 1),
       ('7d8c6ad1-3d45-47ef-a56e-c50e38329885', 'Traditional Trade', 'Traditional Trade',
        'e5f7d3e1-ff7e-4b71-8ab1-041a0c9d7e15', 0, '2024-04-12 16:32:05', '2024-04-12 16:32:05', 'Admin Admin',
        'Admin Admin', 1, 1),
       ('8d1e8eb9-c1a5-4b9a-98ad-b5e61a2d3f21', 'Modern Trade', 'Modern Trade', 'e5f7d3e1-ff7e-4b71-8ab1-041a0c9d7e15',
        0, '2024-04-12 16:32:05', '2024-04-12 16:32:05', 'Admin Admin', 'Admin Admin', 1, 1),
       ('9b8e9aa1-1eaf-4d4d-9202-19aeb48d26bc', 'Wholesale (FS)', 'Wholesale (FS)',
        '7d8c6ad1-3d45-47ef-a56e-c50e38329885', 0, '2024-04-12 16:32:05', '2024-04-12 16:32:05', 'Admin Admin',
        'Admin Admin', 1, 1),
       ('b3f2e8f0-c3bd-4c6c-ae4c-650ec5bba9b2', 'Catering', 'Catering', '7d8c6ad1-3d45-47ef-a56e-c50e38329885', 0,
        '2024-04-12 16:32:05', '2024-04-12 16:32:05', 'Admin Admin', 'Admin Admin', 1, 1),
       ('c9d1c5d3-b2a6-4cd1-8b3a-ec94d1e34fcf', 'Horeca - Multiunits', 'Horeca - Multiunits',
        '8d1e8eb9-c1a5-4b9a-98ad-b5e61a2d3f21', 0, '2024-04-12 16:32:05', '2024-04-12 16:32:05', 'Admin Admin',
        'Admin Admin', 1, 1),
       ('e5f7d3e1-ff7e-4b71-8ab1-041a0c9d7e15', 'Food Service', 'Food Service', NULL, 0, '2024-04-12 16:32:05',
        '2024-04-12 16:32:05', 'Admin Admin', 'Admin Admin', 1, 1);
INSERT INTO tbl_divisions (id, name_en, name_ar, parent_division_id, is_deleted, createdate, lastmodifieddate,
                           createbyname, lastmodifiedbyname, createdbyid, lastmodifiedbyid)
VALUES ('f6b7b9b9-7a2a-43cb-85f9-af5eb02f1849', 'Horeca - HRI', 'Horeca - HRI', '8d1e8eb9-c1a5-4b9a-98ad-b5e61a2d3f21',
        0, '2024-04-12 16:32:05', '2024-04-12 16:32:05', 'Admin Admin', 'Admin Admin', 1, 1);



CREATE TABLE tbl_items
(
    id                 VARCHAR(255) PRIMARY KEY,
    name_en            VARCHAR(255),
    name_ar            VARCHAR(255),
    item_code          VARCHAR(255),
    brand              VARCHAR(255),
    country            VARCHAR(255),
    item_category      VARCHAR(255),
    status             VARCHAR(255),
    item_group         VARCHAR(255),
    item_class         VARCHAR(255),
    image_url          VARCHAR(255),
    is_deleted         BOOLEAN  DEFAULT FALSE,
    createdate         DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);

CREATE TABLE tbl_item_cost_rel
(
    id         VARCHAR(36) PRIMARY KEY,
    uom        VARCHAR(255),
    cost DOUBLE,
    currency   VARCHAR(255),
    item_id    VARCHAR(36),
    is_deleted BOOLEAN DEFAULT FALSE
);

ALTER TABLE tbl_item_cost_rel
    ADD CONSTRAINT fk_item_cost_rel_item FOREIGN KEY (item_id) REFERENCES tbl_items (id);

CREATE TABLE tbl_item_uom_mapping
(
    id            VARCHAR(36) PRIMARY KEY,
    from_uom      VARCHAR(255),
    uom_factor DOUBLE,
    price_factor DOUBLE,
    to_uom        VARCHAR(255),
    base_uom_flag BOOLEAN DEFAULT FALSE,
    item_id       VARCHAR(36),
    is_deleted    BOOLEAN DEFAULT FALSE
);

ALTER TABLE tbl_item_uom_mapping
    ADD CONSTRAINT fk_item_uom_mapping_item FOREIGN KEY (item_id) REFERENCES tbl_items (id);


CREATE TABLE tbl_catalogs
(
    id                   VARCHAR(36) PRIMARY KEY,
    name                 VARCHAR(255),
    status               VARCHAR(255),
    type                 VARCHAR(255),
    description          VARCHAR(255),
    division_id          VARCHAR(255),
    org_id               VARCHAR(255),
    parent_division_id   VARCHAR(255),
    currency             VARCHAR(255),
    secondary_catalog_id VARCHAR(36),
    tenant_id            BIGINT           DEFAULT 1,
    is_deleted           BOOLEAN NOT NULL DEFAULT FALSE,
    createdate           DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate     DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname         VARCHAR(255),
    lastmodifiedbyname   VARCHAR(255),
    createdbyid          BIGINT,
    lastmodifiedbyid     BIGINT
);

CREATE TABLE tbl_catalog_dtls
(
    id                 VARCHAR(36) PRIMARY KEY,
    status             VARCHAR(255),
    item_id            VARCHAR(255),
    action             VARCHAR(255),
    identifier         VARCHAR(255),
    start_date         DATE,
    end_date           DATE,
    std_price DOUBLE,
    min_price DOUBLE,
    max_price DOUBLE,
    max_qty            BIGINT,
    uom                VARCHAR(255),
    cost DOUBLE,
    max_qty_type       VARCHAR(255),
    std_price_type     VARCHAR(255),
    max_price_type     VARCHAR(255),
    min_price_type     VARCHAR(255),
    std_price_value DOUBLE,
    max_price_value DOUBLE,
    min_price_value DOUBLE,
    catalog_id         VARCHAR(36),
    tenant_id          BIGINT           DEFAULT 1,
    is_from_current    TINYINT(1) DEFAULT 1,
    is_deleted         BOOLEAN NOT NULL DEFAULT FALSE,
    createdate         DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);


ALTER TABLE tbl_catalog_dtls
    ADD CONSTRAINT fk_catalog_dtls_catalog FOREIGN KEY (catalog_id) REFERENCES tbl_catalogs (id) ON DELETE CASCADE;

CREATE TABLE tbl_catalog_customer_rel
(
    id          VARCHAR(36) PRIMARY KEY,
    catalog_id  VARCHAR(36),
    customer_id VARCHAR(255),
    name_en     VARCHAR(255),
    name_ar     VARCHAR(255),
    tenant_id   BIGINT           DEFAULT 1,
    is_deleted  BOOLEAN NOT NULL DEFAULT FALSE
);

ALTER TABLE tbl_catalog_customer_rel
    ADD CONSTRAINT fk_catalog_customer_rel_catalog FOREIGN KEY (catalog_id) REFERENCES tbl_catalogs (id) ON DELETE CASCADE;

CREATE TABLE tbl_catalog_history
(
    id                 VARCHAR(36) PRIMARY KEY,
    status             VARCHAR(255),
    item_id            VARCHAR(255),
    action             VARCHAR(255),
    identifier         VARCHAR(255),
    start_date         DATE,
    end_date           DATE,
    std_price DOUBLE,
    min_price DOUBLE,
    max_price DOUBLE,
    max_qty            BIGINT,
    uom                VARCHAR(255),
    cost DOUBLE,
    max_qty_type       VARCHAR(255),
    std_price_type     VARCHAR(255),
    max_price_type     VARCHAR(255),
    min_price_type     VARCHAR(255),
    std_price_value DOUBLE,
    max_price_value DOUBLE,
    min_price_value DOUBLE,
    catalog_id         VARCHAR(36),
    tenant_id          BIGINT           DEFAULT 1,
    is_deleted         BOOLEAN NOT NULL DEFAULT FALSE,
    createdate         DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);

ALTER TABLE tbl_catalog_history
    ADD CONSTRAINT fk_catalog_history_catalog FOREIGN KEY (catalog_id) REFERENCES tbl_catalogs (id) ON DELETE CASCADE;

CREATE TABLE tbl_promotions
(
    id                   VARCHAR(255) PRIMARY KEY,
    name                 VARCHAR(255),
    promo_code           VARCHAR(255),
    status               VARCHAR(255),
    start_date           DATE,
    end_date             DATE,
    description          VARCHAR(255),
    qualifier_type       VARCHAR(255),
    division_id          VARCHAR(255),
    division             VARCHAR(255),
    promotion_type       VARCHAR(255),
    promotion_sub_type   VARCHAR(255),
    matching_order_value VARCHAR(255),
    promotion_value DOUBLE,
    activation_status    VARCHAR(255),
    promotion_percentage_value DOUBLE,
    currency             VARCHAR(255),
    tenant_id            BIGINT  DEFAULT 1,
    is_deleted           BOOLEAN DEFAULT FALSE,
    createdate           TIMESTAMP    NOT NULL,
    lastmodifieddate     TIMESTAMP    NOT NULL,
    createbyname         VARCHAR(255) NOT NULL,
    lastmodifiedbyname   VARCHAR(255) NOT NULL,
    createdbyid          BIGINT       NOT NULL,
    lastmodifiedbyid     BIGINT       NOT NULL
);

CREATE TABLE tbl_promotion_item_details
(
    id           VARCHAR(255) PRIMARY KEY,
    item_id      VARCHAR(255),
    description  VARCHAR(255),
    uom          VARCHAR(255),
    qty DOUBLE,
    max_qty DOUBLE,
    price DOUBLE,
    is_base_item BOOLEAN DEFAULT FALSE,
    promotion_id VARCHAR(255),
    is_deleted   BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (promotion_id) REFERENCES tbl_promotions (id)
);

CREATE TABLE tbl_promotion_customer_rel
(
    id           VARCHAR(255) PRIMARY KEY,
    customer_id  VARCHAR(255),
    name_en      VARCHAR(255),
    name_ar      VARCHAR(255),
    is_deleted   BOOLEAN DEFAULT FALSE,
    promotion_id VARCHAR(255),
    FOREIGN KEY (promotion_id) REFERENCES tbl_promotions (id)
);

CREATE TABLE tbl_quote_contract
(
    is_deleted         BOOLEAN NOT NULL DEFAULT FALSE,
    end_date           date,
    id                 VARCHAR(255) PRIMARY KEY,
    start_date         date,
    tenant_id          bigint,
    validity_date      date,
    customer_id        varchar(255),
    description        varchar(255),
    name_ar            varchar(255),
    name_en            varchar(255),
    number             varchar(255),
    status             varchar(255),
    type               varchar(255),
    createdate         DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);

CREATE TABLE tbl_quote_contract_dtls
(
    commited_qty double,
    is_deleted         BOOLEAN NOT NULL DEFAULT FALSE,
    consumed_qty double,
    expected_price double,
    id                 VARCHAR(255) PRIMARY KEY,
    quote_id           VARCHAR(255),
    tenant_id          bigint,
    item_id            varchar(255),
    status             varchar(255),
    uom                varchar(255),
    createdate         DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate   DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname       VARCHAR(255),
    lastmodifiedbyname VARCHAR(255),
    createdbyid        BIGINT,
    lastmodifiedbyid   BIGINT
);

ALTER TABLE tbl_quote_contract_dtls
    ADD CONSTRAINT fk_quote_dtls_quote FOREIGN KEY (quote_id) REFERENCES tbl_quote_contract (id) ON DELETE CASCADE;

CREATE TABLE tbl_quote_contract_doc_dtls
(
    is_deleted          BOOLEAN NOT NULL DEFAULT FALSE,
    id                  VARCHAR(255) PRIMARY KEY,
    quote_id            VARCHAR(255),
    tenant_id           bigint           DEFAULT NULL,
    file_name           varchar(255)     DEFAULT NULL,
    file_path           varchar(255)     DEFAULT NULL,
    unique_file_name    varchar(255)     DEFAULT NULL,
    document_type       varchar(255)     DEFAULT NULL,
    external_identifier varchar(255)     DEFAULT NULL,
    from_date           date             DEFAULT NULL,
    to_date             date             DEFAULT NULL,
    unique_name         varchar(255)     DEFAULT NULL,
    createdate          DATETIME         DEFAULT CURRENT_TIMESTAMP,
    lastmodifieddate    DATETIME         DEFAULT CURRENT_TIMESTAMP,
    createbyname        VARCHAR(255),
    lastmodifiedbyname  VARCHAR(255),
    createdbyid         BIGINT,
    lastmodifiedbyid    BIGINT
);

ALTER TABLE tbl_quote_contract_doc_dtls
    ADD CONSTRAINT fk_quote_doc_quote FOREIGN KEY (quote_id) REFERENCES tbl_quote_contract (id) ON DELETE CASCADE;

CREATE TABLE tbl_syssetting
(
    is_deleted       BOOLEAN NOT NULL DEFAULT FALSE,
    is_tenant_config bit(1),
    iid              BIGINT AUTO_INCREMENT PRIMARY KEY,
    tenant_id        bigint,
    category         varchar(255),
    category_group   varchar(255),
    display_key      varchar(255),
    flag_name        varchar(255),
    value            longtext
);




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
    exception_name     VARCHAR(255),
    createdbyid        BIGINT,
    description        VARCHAR(255),
    status             VARCHAR(255),
    lastmodifiedbyid   BIGINT
);

CREATE TABLE tbl_catalog_exception_item
(
    id                        VARCHAR(255) PRIMARY KEY,
    item_id                   VARCHAR(255),
    uom                       VARCHAR(255),
    cost DOUBLE,
    allow_std_price           VARCHAR(255),
    allow_multiple_shelf_life VARCHAR(255),
    catalog_exception_id      VARCHAR(255),
    end_date                  DATE,
    start_date                DATE,
    is_deleted                BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (catalog_exception_id) REFERENCES tbl_catalog_exception (id)
);

CREATE TABLE tbl_catalog_exception_override_details
(
    id                        VARCHAR(255) PRIMARY KEY,
    line_type                 VARCHAR(255),
    is_primary                BOOLEAN DEFAULT FALSE,
    shelf_life                VARCHAR(255),
    std_price_type            VARCHAR(255),
    std_price_value DOUBLE,
    final_std_price DOUBLE,
    max_price_type            VARCHAR(255),
    max_price_value DOUBLE,
    final_max_price DOUBLE,
    limit_max_quantity_type   VARCHAR(255),
    limit_max_quantity_value DOUBLE,
    stock_on_hand DOUBLE,
    consumed_stock DOUBLE,
    catalog_exception_item_id VARCHAR(255),
    uom                       VARCHAR(255),
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
    number               VARCHAR(36)
);

