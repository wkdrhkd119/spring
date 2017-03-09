create table reply(
rnum	 number	           not null,
content   varchar(500)       not null,
regdate   date                not null,
id 	 varchar(10)        not null,
bbsno	 number(7) 	not null,
primary   key(rnum),
foreign   key(bbsno)  	references bbs(bbsno)
)
 
--create(��۵��)
select * from MEMBER;
select * from bbs;
 
select nvl(max(rnum),0)+1 from reply;
 
insert into reply(rnum, content, regdate, id, bbsno)
values((select nvl(max(rnum),0)+1 from reply),
'�ǰ��Դϴ�.',sysdate,'user1',1
)
 
 
--read(��� ����)
select * from reply
 
--update(��� ����)
update reply
set content = '���ο� �ǰ��� �ø��ϴ�.'
where rnum = 1
 
--delete(��� ����)
delete from REPLY
where rnum = 1
 
 
--list(���)
select rnum, content, to_char(regdate,'yyyy-mm-dd') regdate, id, bbsno, r
FROM(
select rnum, content, regdate, id, bbsno, rownum r
FROM(
select rnum, content, regdate, id, bbsno
from REPLY
order by rnum DESC
    )
)WHERE r >= 1 and r <= 5
 
 
--total(���)
select count(*) from reply
