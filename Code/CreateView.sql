
-- File contains database Views

-- View: public.vstatepopulation

-- DROP VIEW public.vstatepopulation;

CREATE OR REPLACE VIEW public.vstatepopulation AS
 SELECT s.name AS state,
    s.name_a2 AS state_a2,
    p.population,
    p.year
   FROM state s
     JOIN state_population p ON s.id = p.state_id;

ALTER TABLE public.vstatepopulation
    OWNER TO postgres;



