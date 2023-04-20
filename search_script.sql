--- Search Two ---

--- Articles from Keywords, Titles and Abstracts ---

create table evolgath
as
select * from wos_b_202204.items
where exists (
  select * from unnest(wos_b_202204.items.keyword) n
  where n like 'evolutionary game theory%')

CREATE TABLE evolgath_titles AS
select * from wos_b_202210.items where item_title like '%evolutionary game theory%';
       
CREATE TABLE evolgath_abstract AS
select * from wos_b_202210.abstracts where abstract[1] like '%evolutionary game theory%';


create table emcoop
as
select * from wos_b_202204.items
where exists (
  select * from unnest(wos_b_202204.items.keyword) n
  where n like 'emergence of cooperation%')
  
CREATE TABLE emcoop_titles AS
select * from wos_b_202210.items where item_title like '%emergence of cooperation%';

CREATE TABLE evolcoop_abstract AS
select * from wos_b_202210.abstracts where abstract[1] like '%emergence of cooperation%';

select abstract[1] from wos_b_202210.abstracts;

CREATE TABLE evolcoop_titles AS
select * from wos_b_202210.items where item_title like '%evolution of cooperation%';

CREATE TABLE evolcoop_abstract AS
select * from wos_b_202210.abstracts where abstract[1] like '%evolution of cooperation%';


CREATE TABLE items_wos_emcoop AS
    select * 
    from wos_b_202210.items
        where exists (
          select * from unnest(wos_b_202210.items.keyword) n
          where n like 'emergence of cooperation%');
