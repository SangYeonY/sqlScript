-- ������ Ÿ�� number ���� ���̺�
-- number : �ڹ� byte,short,int,long,float,double �ش�
-- 				number(��ü�ڸ���,�Ҽ����ڸ���)

-- table_number  ���̺� �̸�
CREATE TABLE table_number(
	col1 NUMBER,		-- �ڸ����� �������� ������ �ִ� 38�ڸ� �Դϴ�.
	col2 number(5) ,
	col3 number (7,2),
	col4 number (2,5)
);
-- ���� ����
INSERT INTO IDEV.table_number (col1,col2,col3,col4)
values(1234567,12345,12345.67,0.00012);
-- col2 �÷��� �ڸ����� 6�� : ����
INSERT INTO IDEV.table_number (col1,col2,col3,col4)
values(1234567,123456,12345.67,0.00012);
-- col3 �÷��� �Ҽ��� ���� �ڸ����� 2�� : �ݿø�
INSERT INTO IDEV.table_number (col1,col2,col3,col4)
values(1234567,12345,12345.67,0.00012);
-- col3 �÷� ��ü �ڸ��� 7�� : �Ҽ������� �׻� 2�� , �׸��� ������ 5�ڸ� -> ����
INSERT INTO IDEV.table_number (col1,col2,col3,col4)
values(1234567,12345,12345.678,0.00012);

--col4 �÷��� number(2,5) : 0 �ƴ� ��ȿ�ڸ��� 5�� , 
-- �� �� �׻�~~~ ��ȿ�ڸ��� �ִ� 2��(0 ���� ����), ������ 3���� ������ 0
INSERT INTO IDEV.table_number (col1,col2,col3,col4)
values(1234567,12345,12345.67,0.000126);
--col4 �÷��� number(2,5) :�ּ� ������ 3���� ��ȿ�ڸ��� 0 -> �̰��� �ƴϸ� ����
INSERT INTO IDEV.table_number (col1,col2,col3,col4)
values(1234567,12345,12345.67,0.0012);


-- 0.000121300 �� ��, ��ȿ�� ���� 0.000123  ,  123 �ڿ� 00�� ��ȿ�� ���� �ƴմϴ�.
-- 00123000 �� ��, ��ȿ�� ���� 123000, 123 �տ� 00�� ��ȿ�� ���� �ƴմϴ�.