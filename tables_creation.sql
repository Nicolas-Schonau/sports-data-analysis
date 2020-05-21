-- Creation of the Batting table
CREATE TABLE public.batting
(
    playerid character varying COLLATE pg_catalog."default",
    yearid numeric,
    stint numeric,
    teamid character varying COLLATE pg_catalog."default",
    lgid character varying COLLATE pg_catalog."default",
    g numeric,
    ab numeric,
    r numeric,
    h numeric,
    scndb numeric,
    trdb numeric,
    hr numeric,
    rbi numeric,
    sb numeric,
    cs numeric,
    bb numeric,
    so numeric,
    ibb numeric,
    hbp numeric,
    sh numeric,
    sf numeric,
    gidp numeric
)

-- Creation of the People table
CREATE TABLE public.people
(
    playerid character varying COLLATE pg_catalog."default",
    birthyear numeric,
    birthmonth numeric,
    birthday numeric,
    birthcountry character varying COLLATE pg_catalog."default",
    birthstate character varying COLLATE pg_catalog."default",
    birthcity character varying COLLATE pg_catalog."default",
    deathyear numeric,
    deathmonth numeric,
    deathday numeric,
    deathcountry character varying COLLATE pg_catalog."default",
    deathstate character varying COLLATE pg_catalog."default",
    deathcity character varying COLLATE pg_catalog."default",
    namefirst character varying COLLATE pg_catalog."default",
    namelast character varying COLLATE pg_catalog."default",
    namegiven character varying COLLATE pg_catalog."default",
    weight numeric,
    height numeric,
    bats character varying COLLATE pg_catalog."default",
    throws character varying COLLATE pg_catalog."default",
    debut date,
    finalgame date,
    retroid character varying COLLATE pg_catalog."default",
    bbrefid character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public.people
    OWNER to postgres;

-- Creation of the teams table
CREATE TABLE public.teams
(
    yearid numeric,
    lgid character varying COLLATE pg_catalog."default",
    teamid character varying COLLATE pg_catalog."default",
    franchid character varying COLLATE pg_catalog."default",
    divid character varying COLLATE pg_catalog."default",
    rank numeric,
    g numeric,
    ghome numeric,
    w numeric,
    l numeric,
    divwin character varying COLLATE pg_catalog."default",
    wcwin character varying COLLATE pg_catalog."default",
    lgwin character varying COLLATE pg_catalog."default",
    wswin character varying COLLATE pg_catalog."default",
    r numeric,
    ab numeric,
    h numeric,
    scndb numeric,
    trdb numeric,
    hr numeric,
    bb numeric,
    so numeric,
    sb numeric,
    cs numeric,
    hbp numeric,
    sf numeric,
    ra numeric,
    er numeric,
    era numeric,
    cg numeric,
    sho numeric,
    sv numeric,
    ipouts numeric,
    ha numeric,
    hra numeric,
    bba numeric,
    soa numeric,
    e numeric,
    dp numeric,
    fp numeric,
    name character varying COLLATE pg_catalog."default",
    park character varying COLLATE pg_catalog."default",
    attendance numeric,
    bpf numeric,
    ppf numeric,
    teamidbr character varying COLLATE pg_catalog."default",
    teamidlahman45 character varying COLLATE pg_catalog."default",
    teamidretro character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public.teams
    OWNER to postgres;


-- Creation of the pitching table

CREATE TABLE public.pitching
(
    playerid character varying COLLATE pg_catalog."default",
    yearid numeric,
    stint numeric,
    teamid character varying COLLATE pg_catalog."default",
    lgid character varying COLLATE pg_catalog."default",
    w numeric,
    l numeric,
    g numeric,
    gs numeric,
    cg numeric,
    sho numeric,
    sv numeric,
    ipouts numeric,
    h numeric,
    er numeric,
    hr numeric,
    bb numeric,
    so numeric,
    baopp numeric,
    era numeric,
    ibb numeric,
    wp numeric,
    hbp numeric,
    bk numeric,
    bfp numeric,
    gf numeric,
    r numeric,
    sh numeric,
    sf numeric,
    gidp numeric
)

TABLESPACE pg_default;

ALTER TABLE public.pitching
    OWNER to postgres;

-- Creation of the pitchingpost table

CREATE TABLE public.pitchingpost
(
    playerid character varying COLLATE pg_catalog."default",
    yearid numeric,
    round character varying COLLATE pg_catalog."default",
    teamid character varying COLLATE pg_catalog."default",
    lgid character varying COLLATE pg_catalog."default",
    w numeric,
    l numeric,
    g numeric,
    gs numeric,
    cg numeric,
    sho numeric,
    sv numeric,
    ipouts numeric,
    h numeric,
    er numeric,
    hr numeric,
    bb numeric,
    so numeric,
    baopp numeric,
    era character varying COLLATE pg_catalog."default",
    ibb numeric,
    wp numeric,
    hbp numeric,
    bk numeric,
    bfp numeric,
    gf numeric,
    r numeric,
    sh numeric,
    sf numeric,
    gidp numeric
)

TABLESPACE pg_default;

ALTER TABLE public.pitchingpost
    OWNER to postgres;
