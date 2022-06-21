CREATE TABLE "responsibilitiy" (
	"responsibilitiy_id" serial NOT NULL,
	"responsibilitiy_name" VARCHAR(255) NOT NULL,
	CONSTRAINT "responsibilitiy_pk" PRIMARY KEY ("responsibilitiy_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "domain" (
	"domain_id" serial NOT NULL,
	"domain_name" VARCHAR(255) NOT NULL,
	"customer_id" integer NOT NULL UNIQUE,
	CONSTRAINT "domain_pk" PRIMARY KEY ("domain_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "customer" (
	"customer_id" serial NOT NULL,
	"customer_name" VARCHAR(255) NOT NULL,
	"product_id" integer NOT NULL UNIQUE,
	CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "product" (
	"product_id" serial NOT NULL,
	"product_name" VARCHAR(255) NOT NULL,
	"team_id" integer NOT NULL,
	CONSTRAINT "product_pk" PRIMARY KEY ("product_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "team" (
	"team_id" serial NOT NULL,
	"team_name" VARCHAR(255) NOT NULL,
	CONSTRAINT "team_pk" PRIMARY KEY ("team_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "members" (
	"member_id" serial NOT NULL,
	"member_name" VARCHAR(255) NOT NULL,
	"responsibilitiy" integer NOT NULL,
	"team" integer NOT NULL,
	CONSTRAINT "members_pk" PRIMARY KEY ("member_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "domain" ADD CONSTRAINT "domain_fk0" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");

ALTER TABLE "customer" ADD CONSTRAINT "customer_fk0" FOREIGN KEY ("product_id") REFERENCES "product"("product_id");

ALTER TABLE "product" ADD CONSTRAINT "product_fk0" FOREIGN KEY ("team_id") REFERENCES "team"("team_id");


ALTER TABLE "members" ADD CONSTRAINT "members_fk0" FOREIGN KEY ("responsibilitiy") REFERENCES "responsibilitiy"("responsibilitiy_id");
ALTER TABLE "members" ADD CONSTRAINT "members_fk1" FOREIGN KEY ("team") REFERENCES "team"("team_id");







