-- ���ڿ� Ÿ��
-- CHAR(����) : �������� , ������ ����Ʈ 
-- VARCHAR(����) : ����Ŭ���� �����ϰ� ������� �ʴ� ���� �ڷ���()
-- VARCHAR2(����) : ���������� ���� ����Ʈ, ���̴� �ִ�����̰� ������ �޸𸮴� ������ũ�⸸ŭ ����մϴ�.
-- 		�ִ� 2000����Ʈ�Դϴ�.	UTF-8 ���ڵ����� �ѱ��� 3�ٟ�, ����/����/��ȣ�� 1����Ʈ

CREATE TABLE table_string(
	acol char(10),
	bcol varchar2(10),
	ccol nchar(10),
	dcol nvarchar2(10)
);

-- CHAR Ÿ�� Ȯ��
INSERT INTO Table_string(acol) VALUES ('abcdefghij');
INSERT INTO Table_string(acol) VALUES ('abcde');
INSERT INTO Table_string(acol) VALUES ('�����ٶ�'); -- 4���� * 3����Ʈ
INSERT INTO Table_string(acol) VALUES ('������');	  	

-- VARCHAR2 Ÿ�� Ȯ�� : CHAR �������� �߰��Ǵ� ���� �����ϴ�.
INSERT INTO Table_string(bcol) VALUES ('abcdefghij');
INSERT INTO Table_string(bcol) VALUES ('abcde');
INSERT INTO Table_string(bcol) VALUES ('�����ٶ�'); -- 4���� * 3����Ʈ
INSERT INTO Table_string(bcol) VALUES ('������');	  	

-- NCHAR Ÿ�� Ȯ�� : �������� , ������ ���ڰ���
INSERT INTO Table_string(ccol) VALUES ('abcdefghij');
INSERT INTO Table_string(ccol) VALUES ('abcde');
INSERT INTO Table_string(ccol) VALUES ('�����ٶ�'); -- 4���� * 3����Ʈ
INSERT INTO Table_string(ccol) VALUES ('�����ٶ󸶹ٻ������'); -- 10���ڴ� ����
INSERT INTO Table_string(ccol) VALUES ('�����ٶ󸶹ٻ������ī');	  	-- 11���ڴ� ����


-- NVARCHAR2 Ÿ�� Ȯ�� : �������� , ������ ���ڰ���
INSERT INTO Table_string(dcol) VALUES ('abcdefghij');
INSERT INTO Table_string(dcol) VALUES ('abcde');
INSERT INTO Table_string(dcol) VALUES ('�����ٶ�'); -- 4���� * 3����Ʈ
INSERT INTO Table_string(dcol) VALUES ('�����ٶ󸶹ٻ������'); -- 10���ڴ� ����
INSERT INTO Table_string(dcol) VALUES ('�����ٶ󸶹ٻ������ī');	  	-- 11���ڴ� ����

-- �������� ���ڰ� ���ǰ� ����� �� NVARCHAR2 �� ���ڼ��� ����ϴ� ���� �ǰ�����Դϴ�.

