\-- first you need to create client and car tables and then import the data

-- defining schema

create table model (
	model_id     serial,
	brand_id     int8      not null,
	name         varchar(128) not null,
	drive        varchar(128),
	transmission varchar(128),
	cityMPG      float8,
	highwayMPG   float8,
	primary key (model_id)
);

create table brand (
	brand_id     serial,
	name         varchar(128) not null,
	primary key (brand_id)
);

create table rent (
	date_since date     not null default '1980-01-01',
	date_till  date     not null default '1980-01-01',
	vin        varchar(128) not null,
	client_id  int8      not null,
  sum        float8     not null default 0.0,
	primary key (date_since, date_till, vin)
);

-- defining data
