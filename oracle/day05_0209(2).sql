-- commit , rollback �׽�Ʈ
-- 	�� ���� auto commit ������ �����ؾ��մϴ�.
-- 	�� ���1) ���� �����⿡ ���ؼ��� ���� (�����ͺ��̽� �޴� - Ʈ����� ��� - manual commit)
--  �� ���2)������ �޴� - ���� - ���� - ���� ������ auto commit�� ����

SELECT * FROM tbl#;	-- �ʱ���� Ȯ��

DELETE FROM tbl# WHERE acol = 'momo';
SELECT * FROM tbl#;	-- Ȯ��


ROLLBACK;	-- DELETE ����� ������ �ǵ�����(���)
SELECT * FROM tbl#; -- Ȯ��

DELETE FROM tbl# WHERE acol = 'momo';
SELECT * FROM tbl#;	-- Ȯ��
COMMIT;
SELECT * FROM tbl#;	-- Ȯ��
rollback ;
SELECT * FROM tbl#;	-- Ȯ��

-- ���� ���� 3��
INSERT INTO "TBL#" (acol,age) VALUES ('nana',33);
SELECT * FROM tbl#;
rollback ;
SELECT * FROM tbl#;	-- Ȯ��

-- ���� ���� 4��
INSERT INTO "TBL#" (acol,age) VALUES ('nana22',33);
INSERT INTO "TBL#" (acol,age) VALUES ('����',29);
COMMIT;
SELECT * FROM tbl#;	-- Ȯ��
UPDATE "TBL#" SET bcol = 'test' WHERE acol = 'nana22';
DELETE FROM "TBL#" t WHERE acol = 'main22';
rollback ;
SELECT * FROM tbl#;	-- Ȯ��