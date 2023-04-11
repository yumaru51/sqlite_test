
-->VIEWのリフレッシュ
EXEC sp_refreshview 'ビューの名前';

-->一括で行う場合
SELECT name, 'EXEC sp_refreshview ''' + name + ''';' AS QUERY FROM sys.views

