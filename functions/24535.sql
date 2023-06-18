delimiter $$
create function  ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
returns int
deterministic
begin
SET @res := if (lower(word) REGEXP concat("[",set_of_letters,"]*"),1,0);
return(
@res
);
end 
$$
delimiter ;
drop function ufn_is_word_comprised;
select "oistmiahf","Sofia", ufn_is_word_comprised("oistmiahf","Sofia");