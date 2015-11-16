# coursework
----
## ǰ��
���õ�bootstrap��ǰ��״̬���£�


```flow
				
						   	      +----------------+	
						      +--->crafts require  <-----------------------------+
		                      |   +----------------+							 |
						      | 											     |
						      |	  +----------------+		                     | 
						      +--->crafts overview |	   +---------------+     |
						      |   +----------------+  +---->publish needs  +--(json)
	+-------+                 |						  |	   +---------------+    
	|       |    			  |                       |
	| index |  			      |   +---------------+   |	   +---------------+
	|       +--(login/regist)-+--->user management+---+----> profile	   |
	+---+---+  	 		      |   +---------------+   |	   +---------------+
						      |                       |	
						      |						  |    +--------------+
						      |                       +----> my orders    |
						      |   +---------------+		   +--------------+
						      +--->product detail |
						 	      +---------------+

```		
+ ��ͼֻ������ҳ/״̬֮�����ع�ϵ���������������е�·�ɺ���ת����
+ ��ͼ����ͬ��ҳ����ģ���ʾ��һ�������û���Ϣ��������ǿ��޸�״̬��������޸ĵ�ǰ�û����ϣ�����������ʾ�������ϡ�

## ���
ʹ��php��lavavrel�����ɣ�ΪRESTful������
�ṩ
	+ �û�����
	+ ��������
	+ �������
	+ Session management

SQL��
```sql

create database crafts;

/* ��Ա�� */
CREATE TABLE IF NOT EXISTS `member` 
(
	id int primary key auto_increment,
	username varchar(100) not NULL unique,
	email varchar(100) not null unique,
	password varchar(100) not NULL,
	headpic varchar(100) default '/images/head/0.jpg',
	name varchar(20),
	gender tinyint not null default 0 comment '0:�� 1:Ů',
	saverage int not null default 0,
	sbad int not null default 0,
	name varchar(20),
	phone varchar(20),
	qq varchar(15)��
	intro varchar(1024) comment '��������'
)DEFAULT CHARSET=utf8;


/* �û������ */
CREATE TABLE IF NOT EXISTS `requireTable` 
(
	id int primary key auto_increment,
	uid int not null comment '�����û�',
	name varchar(100) comment '��Ʒ����',
	info text comment '��Ϣ��Ŀ'
)DEFAULT CHARSET=utf8;


/* ��Ʒ��Ϣ�� */
CREATE TABLE IF NOT EXISTS `product` 
(
	id int primary key auto_increment,
	mid int not null comment '������Ʒ��',
	title varchar(100) comment '��Ʒ���ƿɼ���',
	info text comment '��Ʒ���л���Ϣ'
)DEFAULT CHARSET=utf8;

```

## ��������

+ ������bower������ߵµ�ͼ/discuz�ȵ��������API�Ĵ����д�ɽű����㰲װ
+ ���칤�ߣ�Grunt���������������ͳһ���룬��Ϊ��̬�ļ�����
+ �汾���ƣ� Git�����ڰ汾���˺Ͷ��˺���

