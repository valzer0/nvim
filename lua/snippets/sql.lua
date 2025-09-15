local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("table", {
    t("TABLE ")
  }),
  s("view", {
    t("VIEW ")
  }),
  s("temporary", {
    t("TEMPORARY ")
  }),
  s("out", {
    t("OUT")
  }),
  s("to", {
    t("TO ")
  }),
  s("as", {
    t("AS ")
  }),
  s("on", {
    t("ON ")
  }),
  s("new", {
    t("new")
  }),
  s("old", {
    t("old")
  }),
  s("key", {
    t("KEY ")
  }),
  s("tinyint", {
    t("TINYINT ")
  }),
  s("smallint", {
    t("SMALLINT ")
  }),
  s("mediumint", {
    t("MEDIUMINT ")
  }),
  s("int", {
    t("INT ")
  }),
  s("bigint", {
    t("BIGINT ")
  }),
  s("varchar", {
    t("VARCHAR("), i(1, "255"), t(") "), i(0)
  }),
  s("char", {
    t("CHAR("), i(1), t(") "), i(0)
  }),
  s("datetime", {
    t("DATETIME ")
  }),
  s("date", {
    t("DATE ")
  }),
  s("json", {
    t("JSON ")
  }),
  s("text", {
    t("TEXT ")
  }),
  s("mediumtext", {
    t("MEDIUMTEXT ")
  }),
  s("longtext", {
    t("LONGTEXT ")
  }),
  s("true", {
    t("TRUE ")
  }),
  s("false", {
    t("FALSE ")
  }),
  s("integer", {
    t("INTEGER ")
  }),
  s("boolean", {
    t("BOOLEAN ")
  }),
  s("float", {
    t("FLOAT ")
  }),
  s("double", {
    t("DOUBLE ")
  }),
  s("string", {
    t("STRING ")
  }),
  s("blob", {
    t("BLOB ")
  }),
  s("opaoue", {
    t("OPAQUE ")
  }),
  s("error", {
    t("ERROR ")
  }),
  s("empty", {
    t("EMPTY ")
  }),
  s("prepare", {
    t("PREPARE ")
  }),
  s("execute", {
    t("EXECUTE ")
  }),
  s("deallocate", {
    t("DEALLOCATE ")
  }),
  s("using", {
    t("USING ")
  }),
  s("find_in_set", {
    t("FIND_IN_SET("), i(0), t(")")
  }),
  s("json_array", {
    t("JSON_ARRAY("), i(0), t(")")
  }),
  s("json_array_append", {
    t("JSON_ARRAY_APPEND("), i(0), t(" ,'$' ,)")
  }),
  s("json_array_insert", {
    t("JSON_ARRAY_INSERT("), i(0), t(" ,'$[0]' ,)")
  }),
  s("json_contains", {
    t("JSON_CONTAINS("), i(0), t(")")
  }),
  s("json_contains_path", {
    t("JSON_CONTAINS_PATH("), i(0), t(")")
  }),
  s("json_depth", {
    t("JSON_DEPTH("), i(0), t(")")
  }),
  s("json_extract", {
    t("JSON_EXTRACT("), i(1, "in_"), t("jdoc ,'$."), i(0), t("')")
  }),
  s("json_insert", {
    t("JSON_INSERT("), i(0), t(")")
  }),
  s("json_keys", {
    t("JSON_KEYS("), i(0), t(")")
  }),
  s("json_length", {
    t("JSON_LENGTH("), i(0), t(")")
  }),
  s("json_unquote", {
    t("JSON_UNQUOTE("), i(0), t(")")
  }),
  s("json_object", {
    t("JSON_OBJECT("), i(0), t(")")
  }),
  s("json_overlaps", {
    t("JSON_OVERLAPS("), i(0), t(")")
  }),
  s("json_pretty", {
    t("JSON_PRETTY("), i(0), t(")")
  }),
  s("json_quote", {
    t("JSON_QUOTE("), i(0), t(")")
  }),
  s("json_set", {
    t("JSON_SET("), i(0), t(")")
  }),
  s("json_case_check", {
    t("WHEN JSON_EXTRACT(in_jdoc ,'$."), i(1), t(
    "') IS NULL THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Custom error: "), i(1), t(" is null';"), i(0)
  }),
  s("json_merge_patch", {
    t("JSON_MERGE_PATCH("), i(0), t(" ,)")
  }),
  s("json_merge_preserve", {
    t("JSON_MERGE_PRESERVE("), i(0), t(" ,)")
  }),
  s("json_arrayagg", {
    t("JSON_ARRAYAGG("), i(0), t(")")
  }),
  s("json_objectagg", {
    t("JSON_OBJECTAGG("), i(0), t(")")
  }),
  s("json_remove", {
    t("JSON_REMOVE("), i(0), t(")")
  }),
  s("json_replace", {
    t("JSON_REPLACE("), i(0), t(")")
  }),
  s("returning", {
    t("RETURNING ")
  }),
  s("json_valid", {
    t("JSON_VALID("),
    i(0),
    t(")")
  }),
  s("json_type", {
    t("JSON_TYPE("),
    i(0),
    t(")")
  }),
  s("json_type_object", {
    t("JSON_EXTRACT("), i(1), t("jdoc ,'$."), i(2), t("') IS NOT NULL"),
    t({ "", "AND JSON_TYPE(JSON_EXTRACT(" }), i(1), t("jdoc ,'$."), i(2), t("')) = 'OBJECT'"), i(0)
  }),
  s("json_type_array", {
    t("JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("') IS NOT NULL"),
    t({ "\n" }),
    t("AND JSON_TYPE(JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("')) = 'ARRAY'"),
    i(0)
  }),
  s("json_type_string", {
    t("JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("') IS NOT NULL"),
    t({ "\n" }),
    t("AND JSON_TYPE(JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("')) = 'STRING'"),
    t({ "\n" }),
    t("AND CHAR_LENGTH(JSON_VALUE("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING CHAR)) BETWEEN "),
    i(3),
    t(" AND "),
    i(4),
    t({ "\n" }),
    t("AND REGEXP_LIKE(JSON_VALUE("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING CHAR) ,'^[\\\\\\s　]+|[\\\\\\s　]+$' ,'c') IS FALSE"),
    i(0)
  }),
  s("json_type_code", {
    t("JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("') IS NOT NULL"),
    t({ "\n" }),
    t("AND JSON_TYPE(JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("')) = 'STRING'"),
    t({ "\n" }),
    t("AND REGEXP_LIKE(JSON_VALUE("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING CHAR) ,'^"),
    i(3),
    t("\\\\\\d{"),
    i(4),
    t("}$' ,'c')"),
    i(0)
  }),
  s("json_type_integer", {
    t("JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("') IS NOT NULL"),
    t({ "\n" }),
    t("AND JSON_TYPE(JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("')) = 'INTEGER'"),
    i(0)
  }),
  s("json_type_boolean", {
    t("JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("') IS NOT NULL"),
    t({ "\n" }),
    t("AND JSON_TYPE(JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("')) = 'BOOLEAN'"),
    i(0)
  }),
  s("json_type_double", {
    t("JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("') IS NOT NULL"),
    t({ "\n" }),
    t("AND JSON_TYPE(JSON_EXTRACT("),
    i(1),
    t("jdoc ,'$."),
    i(2),
    t("')) = 'DOUBLE'"),
    i(0)
  }),
  s("json_search", {
    t("JSON_SEARCH("),
    i(0),
    t(")")
  }),
  s("arrow", {
    t("jdoc->'$."),
    i(0),
    t("'")
  }),
  s("unarrow", {
    t("jdoc->>'$."),
    i(0),
    t("'")
  }),
  s("memberof", {
    t("MEMBER OF ("),
    i(0),
    t(")")
  }),
  s("json_table", {
    t("JSON_TABLE ("),
    t({ "\n" }),
    t("  "),
    i(1),
    t({ "\n" }),
    t("  ,'$[*]' COLUMNS ("),
    t({ "\n" }),
    t("     rid FOR ORDINALITY"),
    t({ "\n" }),
    t("    ,"),
    i(0),
    t(" INT PATH '$' ERROR ON ERROR"),
    t({ "\n" }),
    t("  )"),
    t({ "\n" }),
    t(") AS j")
  }),
  s("forordinality", {
    t("FOR ORDINALITY")
  }),
  s("json_value", {
    t("JSON_VALUE("),
    i(0),
    t(")")
  }),
  s("json_value_float", {
    t("JSON_VALUE("),
    i(1, "in_"),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING FLOAT)"),
    i(0)
  }),
  s("json_value_double", {
    t("JSON_VALUE("),
    i(1, "in_"),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING DOUBLE)"),
    i(0)
  }),
  s("json_value_decimal", {
    t("JSON_VALUE("),
    i(1, "in_"),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING DECIMAL)"),
    i(0)
  }),
  s("json_value_signed", {
    t("JSON_VALUE("),
    i(1, "in_"),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING SIGNED)"),
    i(0)
  }),
  s("json_value_unsigned", {
    t("JSON_VALUE("),
    i(1, "in_"),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING UNSIGNED)"),
    i(0)
  }),
  s("json_value_date", {
    t("JSON_VALUE("),
    i(1, "in_"),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING DATE)"),
    i(0)
  }),
  s("json_value_time", {
    t("JSON_VALUE("),
    i(1, "in_"),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING TIME)"),
    i(0)
  }),
  s("json_value_datetime", {
    t("JSON_VALUE("),
    i(1, "in_"),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING DATETIME)"),
    i(0)
  }),
  s("json_value_char", {
    t("JSON_VALUE("),
    i(1, "in_"),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING CHAR)"),
    i(0)
  }),
  s("json_value_json", {
    t("JSON_VALUE("),
    i(1, "in_"),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING JSON)"),
    i(0)
  }),
  s("erroronerror", {
    t("ERROR ON EMPTY ERROR ON ERROR")
  }),
  s("defaultonemtpy", {
    t("DEFAULT "),
    i(0),
    t(" ON EMPTY")
  }),
  s("json_schema_valid", {
    t("JSON_SCHEMA_VALID('"),
    i(1),
    t("' ,"),
    i(0),
    t(")")
  }),
  s("json_schema_validation_report", {
    t("JSON_SCHEMA_VALIDATION_REPORT('"),
    i(1),
    t("' ,"),
    i(0),
    t(")")
  }),
  s("cast", {
    t("CAST("),
    i(0),
    t(")")
  }),
  s("signed", {
    t("SIGNED")
  }),
  s("unsigned", {
    t("UNSIGNED")
  }),
  s("zerofill", {
    t("ZEROFILL")
  }),
  s("castjson", {
    t("CAST("),
    i(0),
    t(" AS JSON)")
  }),
  s("castsigned", {
    t("CAST("),
    i(0),
    t(" AS SIGNED)")
  }),
  s("castunsigned", {
    t("CAST("),
    i(0),
    t(" AS UNSIGNED)")
  }),
  s("castchar", {
    t("CAST("),
    i(0),
    t(" AS CHAR)")
  }),
  s("castbinary", {
    t("CAST("),
    i(0),
    t(" AS BINARY)")
  }),
  s("castdate", {
    t("CAST("),
    i(0),
    t(" AS DATE)")
  }),
  s("castdatetime", {
    t("CAST("),
    i(0),
    t(" AS DATETIME)")
  }),
  s("casttrue", {
    t("CAST(TRUE AS JSON)")
  }),
  s("castfalse", {
    t("CAST(FALSE AS JSON)")
  }),
  s("alter", {
    t("ALTER ")
  }),
  s("modify", {
    t("MODIFY ")
  }),
  s("rename", {
    t("RENAME ")
  }),
  s("add", {
    t("ADD ")
  }),
  s("addindex", {
    t("ADD INDEX ")
  }),
  s("column", {
    t("COLUMN ")
  }),
  s("alter_table", {
    t("ALTER TABLE "),
    i(0)
  }),
  s("alter_table_column", {
    t("ALTER TABLE "),
    i(1),
    t(" ADD "),
    i(0)
  }),
  s("alter_table_index", {
    t("ALTER TABLE "),
    i(1),
    t(" ADD INDEX "),
    i(0)
  }),
  s("alter_table_uniquekey", {
    t("ALTER TABLE "),
    i(1),
    t(" ADD UNIQUE KEY "),
    i(0)
  }),
  s("alter_table_foreignkey", {
    t("ALTER TABLE "),
    i(1),
    t(" ADD CONSTRAINT "),
    i(2),
    t(" FOREIGN KEY ("),
    i(3),
    t(") REFERENCES "),
    i(4),
    t("("),
    i(0),
    t(");")
  }),
  s("alter_table_check", {
    t("ALTER TABLE "),
    i(1),
    t(" ADD CONSTRAINT "),
    i(2),
    t(" CHECK("),
    i(0),
    t(");")
  }),
  s("renamecolumn", {
    t("RENAME COLUMN ")
  }),
  s("disabletrigger", {
    t("DISABLE TRIGGER ")
  }),
  s("enabletrigger", {
    t("ENABLE TRIGGER ")
  }),
  s("disabletriggerall", {
    t("DISABLE TRIGGER ALL")
  }),
  s("enabletriggerall", {
    t("ENABLE TRIGGER ALL")
  }),
  s("create", {
    t("CREATE ")
  }),
  s("createtable", {
    t("DROP TABLE IF EXISTS "),
    i(1),
    t(";"),
    t({ "\n" }),
    t("CREATE TABLE "),
    i(1),
    t("("),
    t({ "\n" }),
    t("  "),
    i(0),
    t({ "\n" }),
    t(") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;")
  }),
  s("createview", {
    t("CREATE VIEW "),
    i(0),
    t(" AS goto")
  }),
  s("createprocedure", {
    t("DROP PROCEDURE IF EXISTS "),
    i(1),
    t(";"),
    t({ "\n" }),
    t("DELIMITER $$"),
    t({ "\n" }),
    t("CREATE PROCEDURE "),
    i(1),
    t("("),
    t({ "\n" }),
    t("   IN in_userId INT"),
    t({ "\n" }),
    t("  ,IN in_jdoc JSON"),
    t({ "\n" }),
    t(")"),
    t({ "\n" }),
    t("BEGIN"),
    t({ "\n" }),
    t("  "),
    i(0),
    t({ "\n" }),
    t("END"),
    t({ "\n" }),
    t("$$"),
    t({ "\n" }),
    t("DELIMITER ;")
  }),
  s("createfunction", {
    t("CREATE FUNCTION ")
  }),
  s("createtrigger", {
    t("CREATE TRIGGER ")
  }),
  s("createtemporarytable", {
    t("CREATE TEMPORARY TABLE "),
    i(0)
  }),
  s("createuser", {
    t("CREATE USER IF NOT EXISTS "),
    i(0)
  }),
  s("createdatabase", {
    t("CREATE DATABASE ")
  }),
  s("createindex", {
    t("CREATE INDEX "),
    i(0),
    t(" ON ")
  }),
  s("drop", {
    t("DROP ")
  }),
  s("droptable", {
    t("DROP TABLE IF EXISTS ")
  }),
  s("droptemporarytable", {
    t("DROP TABLE IF EXISTS ")
  }),
  s("dropview", {
    t("DROP VIEW IF EXISTS ")
  }),
  s("dropcolumn", {
    t("DROP COLUMN ")
  }),
  s("dropproceduer", {
    t("DROP PROCEDURE IF EXISTS ")
  }),
  s("dropfunction", {
    t("DROP FUNCTION IF EXISTS ")
  }),
  s("droptrigger", {
    t("DROP TRIGGER IF EXISTS ")
  }),
  s("dropindex", {
    t("DROP INDEX "),
    i(0),
    t(" ON ")
  }),
  s("truncatetable", {
    t("TRUNCATE TABLE ")
  }),
  s("insert", {
    t("INSERT ")
  }),
  s("insertinto", {
    t("INSERT INTO ")
  }),
  s("insertintoignore", {
    t("INSERT INTO IGNORE")
  }),
  s("onduplicatekeyupdate", {
    t("ON DUPLICATE KEY UPDATE ")
  }),
  s("last_insert_id", {
    t("LAST_INSERT_ID()")
  }),
  s("into", {
    t("INTO ")
  }),
  s("ignore", {
    t("IGNORE ")
  }),
  s("values", {
    t("VALUES ("),
    i(0),
    t(")")
  }),
  s("update", {
    t("UPDATE ")
  }),
  s("set", {
    t("SET ")
  }),
  s("delete", {
    t("DELETE ")
  }),
  s("deletefrom", {
    t("DELETE "),
    i(0),
    t(" FROM goto WHERE goto")
  }),
  s("select", {
    t("SELECT ")
  }),
  s("from", {
    t("FROM ")
  }),
  s("join", {
    t("JOIN ")
  }),
  s("leftjoin", {
    t("LEFT JOIN ")
  }),
  s("rightjion", {
    t("RIGHT JOIN ")
  }),
  s("crossjoin", {
    t("CROSS JOIN ")
  }),
  s("union", {
    t("UNION ")
  }),
  s("unionall", {
    t("UNION ALL ")
  }),
  s("where", {
    t("WHERE ")
  }),
  s("and", {
    t("AND ")
  }),
  s("or", {
    t("OR ")
  }),
  s("in", {
    t("IN ")
  }),
  s("not", {
    t("NOT")
  }),
  s("notnull", {
    t("NOT NULL")
  }),
  s("inboolean", {
    t("IN (TRUE ,FALSE)")
  }),
  s("notin", {
    t("NOT IN ")
  }),
  s("is", {
    t("IS ")
  }),
  s("istrue", {
    t("IS TRUE")
  }),
  s("isfalse", {
    t("IS FALSE")
  }),
  s("isunknown", {
    t("IS UNKNOWN")
  }),
  s("isnotunknown", {
    t("IS NOT UNKNOWN")
  }),
  s("isnull", {
    t("IS NULL")
  }),
  s("isnotnull", {
    t("IS NOT NULL")
  }),
  s("like", {
    t("LIKE CONCAT('%' ,"),
    i(0),
    t(" ,'%')")
  }),
  s("between", {
    t("BETWEEN "),
    i(1),
    t(" AND "),
    i(0)
  }),
  s("notbetween", {
    t("NOT BETWEEN "),
    i(1),
    t(" AND "),
    i(0)
  }),
  s("exits", {
    t("EXISTS ("),
    i(0),
    t(")")
  }),
  s("notexits", {
    t("NOT EXISTS ("),
    i(0),
    t(")")
  }),
  s("greatest", {
    t("GREATEST("),
    i(0),
    t(")")
  }),
  s("least", {
    t("LEAST("),
    i(0),
    t(")")
  }),
  s("groupby", {
    t("GROUP BY ")
  }),
  s("count", {
    t("COUNT(1) ")
  }),
  s("sum", {
    t("SUM("),
    i(0),
    t(")")
  }),
  s("avg", {
    t("AVG("),
    i(0),
    t(")")
  }),
  s("min", {
    t("MIN("),
    i(0),
    t(")")
  }),
  s("max", {
    t("MAX("),
    i(0),
    t(")")
  }),
  s("distinct", {
    t("DISTINCT ")
  }),
  s("group_concat", {
    t("GROUP_CONCAT("),
    i(0),
    t(" ORDER BY "),
    i(1),
    t(" ASC SEPARATOR '"),
    i(2, ","),
    t("')")
  }),
  s("concatjsonarray", {
    t("CONCAT('[' ,GROUP_CONCAT("),
    i(1),
    t(" ORDER BY "),
    i(0),
    t(" ASC) ,']')")
  }),
  s("concatjsonarraystring", {
    t("CONCAT('[' ,GROUP_CONCAT(/**/ CONCAT('\"' ,"),
    i(1),
    t(" ,'\"') /**/ ORDER BY "),
    i(0),
    t(" ASC) ,']')")
  }),
  s("preconcatjsonarray", {
    t("CAST("),
    t({ "\n" }),
    t("  CONCAT("),
    t({ "\n" }),
    t("    '['"),
    t({ "\n" }),
    t("      ,GROUP_CONCAT("),
    t({ "\n" }),
    t("        "),
    i(1),
    t({ "\n" }),
    t("        ORDER BY "),
    i(0),
    t(" ASC"),
    t({ "\n" }),
    t("      )"),
    t({ "\n" }),
    t("    ,']'"),
    t({ "\n" }),
    t("  ) AS JSON"),
    t({ "\n" }),
    t(") AS ")
  }),
  s("having", {
    t("HAVING ")
  }),
  s("orderby", {
    t("ORDER BY ")
  }),
  s("asc", {
    t("ASC")
  }),
  s("desc", {
    t("DESC")
  }),
  s("limit", {
    t("LIMIT ")
  }),
  s("window", {
    t("WINDOW ")
  }),
  s("partition by", {
    t("PARTITION BY ")
  }),
  s("over", {
    t("OVER ")
  }),
  s("row_number", {
    t("ROW_NUMBER() OVER w ")
  }),
  s("rank", {
    t("RANK() OVER w ")
  }),
  s("dense_rank", {
    t("DENSE_RANK() OVER w ")
  }),
  s("ntile", {
    t("NTILE("),
    i(1),
    t(") OVER w "),
    i(0)
  }),
  s("lag", {
    t("LAG("),
    i(1),
    t(" ,1) OVER w "),
    i(0)
  }),
  s("lead", {
    t("LEAD("),
    i(1),
    t(" ,1) OVER w "),
    i(0)
  }),
  s("percent_rank", {
    t("PERCENT_RANK() OVER w ")
  }),
  s("cume_dist", {
    t("CUME_DIST() OVER w ")
  }),
  s("first_value", {
    t("FIRST_VALUE("),
    i(0),
    t(") OVER w ")
  }),
  s("last_value", {
    t("LAST_VALUE("),
    i(0),
    t(") OVER w ")
  }),
  s("nth_value", {
    t("NTH_VALUE("),
    i(0),
    t(" ,1) OVER w ")
  }),
  s("starttransaction", {
    t("START TRANSACTION;")
  }),
  s("start", {
    t("START ")
  }),
  s("begin", {
    t("BEGIN ")
  }),
  s("rollback", {
    t("ROLLBACK;")
  }),
  s("commit", {
    t("COMMIT;")
  }),
  s("ifexists", {
    t("IF EXISTS ")
  }),
  s("ifnotexists", {
    t("IF NOT EXISTS ")
  }),
  s("null", {
    t("NULL")
  }),
  s("primarykey", {
    t("PRIMARY KEY ")
  }),
  s("unique", {
    t("UNIQUE ")
  }),
  s("uniquekey", {
    t("UNIQUE KEY ")
  }),
  s("index", {
    t("INDEX ")
  }),
  s("constraint", {
    t("CONSTRAINT ")
  }),
  s("references", {
    t("REFERENCES ")
  }),
  s("foreignkey", {
    t("FOREIGN KEY ")
  }),
  s("stored", {
    t("GENERATED ALWAYS AS ("),
    i(0),
    t(") STORED")
  }),
  s("virtual", {
    t("GENERATED ALWAYS AS ("),
    i(0),
    t(") VIRTUAL")
  }),
  s("comment", {
    t("COMMENT '"),
    i(0),
    t("'")
  }),
  s("default", {
    t("DEFAULT ")
  }),
  s("first", {
    t("FIRST")
  }),
  s("last", {
    t("LAST")
  }),
  s("auto_increment", {
    t("AUTO_INCREMENT ")
  }),
  s("engine", {
    t("ENGINE ")
  }),
  s("engineinnodb", {
    t("ENGINE InnoDB ")
  }),
  s("enginemyisam", {
    t("ENGINE MyISAM ")
  }),
  s("innodb", {
    t("InnoDB ")
  }),
  s("myisam", {
    t("MyISAM ")
  }),
  s("collate", {
    t("COLLATE ")
  }),
  s("collateutf8mb4_general_ci", {
    t("COLLATE utf8mb4_general_ci")
  }),
  s("onupdatecurrent_timestamp", {
    t("ON UPDATE CURRENT_TIMESTAMP ")
  }),
  s("charactersetutf8mb4", {
    t("CHARACTER SET utf8mb4")
  }),
  s("charactersetascii", {
    t("CHARACTER SET ascii")
  }),
  s("charset", {
    t("CHARSET ")
  }),
  s("utf8mb4", {
    t("utf8mb4 ")
  }),
  s("utf8mb4_general_ci", {
    t("utf8mb4_general_ci")
  }),
  s("useindex", {
    t("USE INDEX ("),
    i(0),
    t(")")
  }),
  s("ignoreindex", {
    t("IGNORE INDEX ("),
    i(0),
    t(")")
  }),
  s("concat", {
    t("CONCAT("),
    i(0),
    t(")")
  }),
  s("concat_ws", {
    t("CONCAT_WS("),
    i(1, "','"),
    t(" ,"),
    i(0),
    t(")")
  }),
  s("substr", {
    t("SUBSTR("),
    i(0),
    t(")")
  }),
  s("substring", {
    t("SUBSTRING("),
    i(0),
    t(")")
  }),
  s("substring_index", {
    t("SUBSTRING_INDEX("),
    i(0),
    t(" ,',' ,1)")
  }),
  s("trim", {
    t("TRIM("),
    i(0),
    t(")")
  }),
  s("leading", {
    t("LEADING ")
  }),
  s("trailing", {
    t("TRAILING ")
  }),
  s("both", {
    t("BOTH ")
  }),
  s("ltrim", {
    t("LTRIM("),
    i(0),
    t(")")
  }),
  s("rtrim", {
    t("RTRIM("),
    i(0),
    t(")")
  }),
  s("lower", {
    t("LOWER("),
    i(0),
    t(")")
  }),
  s("upper", {
    t("UPPER("),
    i(0),
    t(")")
  }),
  s("length", {
    t("LENGTH("),
    i(0),
    t(")")
  }),
  s("char_length", {
    t("CHAR_LENGTH("),
    i(0),
    t(")")
  }),
  s("replace", {
    t("REPLACE("),
    i(0),
    t(")")
  }),
  s("regexp_like", {
    t("REGEXP_LIKE("),
    i(1),
    t(" ,'^"),
    i(0),
    t("$' ,'c')")
  }),
  s("regexp_replace", {
    t("REGEXP_REPLACE("),
    i(0),
    t(" ,'^"),
    i(1),
    t("$' ,'"),
    i(2),
    t("' ,1 ,0 ,'c')")
  }),
  s("regexp_substr", {
    t("REGEXP_SUBSTR("),
    i(0),
    t(" ,'' ,1 ,1 ,'c')")
  }),
  s("regexp_instr", {
    t("REGEXP_INSTR("),
    i(0),
    t(" ,'' ,1, 0, 'c')")
  }),
  s("format", {
    t("FORMAT("),
    i(0),
    t(" ,0)")
  }),
  s("ceil", {
    t("CEIL("),
    i(0),
    t(")")
  }),
  s("floor", {
    t("FLOOR("),
    i(0),
    t(")")
  }),
  s("round", {
    t("ROUND("),
    i(0),
    t(" ,0)")
  }),
  s("rand", {
    t("RAND()")
  }),
  s("date_format", {
    t("DATE_FORMAT("),
    i(0),
    t(" ,'%Y-%m-%d %H:%i:%s')")
  }),
  s("str_to_date", {
    t("STR_TO_DATE("),
    i(0),
    t(" ,'%Y-%m-%d %H:%i:%s')")
  }),
  s("interval", {
    t("INTERVAL ")
  }),
  s("microsecond", {
    t("MICROSECOND")
  }),
  s("second", {
    t("SECOND")
  }),
  s("minute", {
    t("MINUTE")
  }),
  s("hour", {
    t("HOUR")
  }),
  s("day", {
    t("DAY")
  }),
  s("week", {
    t("WEEK")
  }),
  s("month", {
    t("MONTH")
  }),
  s("quarter", {
    t("QUARTER")
  }),
  s("year", {
    t("YEAR")
  }),
  s("now", {
    t("NOW()")
  }),
  s("current_date", {
    t("CURRENT_DATE")
  }),
  s("current_timestamp", {
    t("CURRENT_TIMESTAMP")
  }),
  s("extract", {
    t("EXTRACT("),
    i(0),
    t(" FROM goto_date_expression)")
  }),
  s("datediff", {
    t("DATEDIFF("),
    i(0),
    t(" ,goto_date)")
  }),
  s("timediff", {
    t("TIMEDIFF("),
    i(0),
    t(" ,goto_datetime)")
  }),
  s("period_diff", {
    t("PERIOD_DIFF("),
    i(0),
    t(" ,goto_YYYYMM)")
  }),
  s("timestamp", {
    t("TIMESTAMP")
  }),
  s("timestampdiff", {
    t("TIMESTAMPDIFF(SECOND ,FROM_UNIXTIME(0) ,"),
    i(0),
    t(")")
  }),
  s("from_unixtime", {
    t("FROM_UNIXTIME("),
    i(0),
    t(")")
  }),
  s("unix_timestamp", {
    t("UNIX_TIMESTAMP("),
    i(0),
    t(")")
  }),
  s("date_add", {
    t("DATE_ADD("),
    i(0),
    t(")")
  }),
  s("date_sub", {
    t("DATE_SUB("),
    i(0),
    t(")")
  }),
  s("procedure", {
    t("PROCEDURE ")
  }),
  s("beginend", {
    t("BEGIN"),
    t({ "\n" }),
    t("  "),
    i(0),
    t({ "\n" }),
    t("END;")
  }),
  s("definer", {
    t("DEFINER = '"),
    i(0),
    t("'@'%' ")
  }),
  s("delimiter", {
    t("DELIMITER ")
  }),
  s("caseendcase", {
    t("CASE"),
    t({ "\n" }),
    t("  WHEN "),
    i(0),
    t(" THEN "),
    t({ "\n" }),
    t("  ELSE "),
    t({ "\n" }),
    t("END CASE;")
  }),
  s("declare", {
    t("DECLARE ")
  }),
  s("call", {
    t("CALL ")
  }),
  s("cursorfor", {
    t("CURSOR FOR ")
  }),
  s("loop", {
    t("LOOP")
  }),
  s("fetch", {
    t("FETCH ")
  }),
  s("open", {
    t("OPEN ")
  }),
  s("close", {
    t("CLOSE ")
  }),
  s("repeat", {
    t("REPEAT ")
  }),
  s("while", {
    t("WHILE ")
  }),
  s("iterate", {
    t("ITERATE ")
  }),
  s("leave", {
    t("LEAVE")
  }),
  s("until", {
    t("UNTIL ")
  }),
  s("genecursor", {
    t("DECLARE done INT DEFAULT FALSE;"),
    t({ "\n" }),
    t("DECLARE cur1 CURSOR FOR "),
    i(0),
    t({ "\n" }),
    t("DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;")
  }),
  s("geneloop", {
    t("OPEN "),
    i(1, "cur1"),
    t(";"),
    t({ "\n" }),
    i(2, "read_loop"),
    t(": LOOP"),
    t({ "\n" }),
    t("  FETCH cur1 INTO "),
    i(3),
    t(";"),
    t({ "\n" }),
    t("  IF done THEN LEAVE "),
    i(2, "read_loop"),
    t("; END IF;"),
    t({ "\n" }),
    t("  "),
    i(0),
    t({ "\n" }),
    t("END LOOP;")
  }),
  s("handlerfor", {
    t("HANDLER FOR ")
  }),
  s("continue", {
    t("CONTINUE")
  }),
  s("exit", {
    t("EXIT")
  }),
  s("sqlwarning", {
    t("SQLWARNING ")
  }),
  s("notfound", {
    t("NOT FOUND ")
  }),
  s("sqlexeption", {
    t("SQLEXCEPTION ")
  }),
  s("sqlstate", {
    t("SQLSTATE '"),
    i(0),
    t("'")
  }),
  s("signalsqlstate", {
    t("SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 9000 ,MESSAGE_TEXT = '"),
    i(0),
    t("';")
  }),
  s("condition", {
    t("DECLARE "),
    i(1, "my_error"),
    t(" CONDITION FOR SQLSTATE '45000';")
  }),
  s("nullcheck", {
    t("IF "),
    i(1),
    t(" IS NULL THEN"),
    t({ "\n" }),
    t("  SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 9000 ,MESSAGE_TEXT = '"),
    i(1),
    t(" is NULL';"),
    t({ "\n" }),
    t("END IF;"),
    t({ "\n" }),
    i(0)
  }),
  s("jsoncheck", {
    t("IF NOT ("),
    t({ "\n" }),
    t("  "),
    i(0),
    t({ "\n" }),
    t(") THEN SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 9000 ,MESSAGE_TEXT = 'in_jdoc."),
    i(1),
    t(" is Error'; END IF;")
  }),
  s("valuecheck", {
    t("IF "),
    i(0),
    t(" THEN"),
    t({ "\n" }),
    t("  SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 9000 ,MESSAGE_TEXT = '"),
    i(1),
    t("';"),
    t({ "\n" }),
    t("END IF;")
  }),
  s("valuescheck", {
    t("IF NOT ("),
    t({ "\n" }),
    t("  "),
    i(1),
    t(" IS NOT NULL"),
    t({ "\n" }),
    t("  AND "),
    i(0),
    t({ "\n" }),
    t(") THEN SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 9000 ,MESSAGE_TEXT = '"),
    i(1),
    t(" is Error'; END IF;")
  }),
  s("exceptioncatch", {
    t("DECLARE EXIT HANDLER FOR SQLEXCEPTION "),
    t({ "\n" }),
    t("  BEGIN"),
    t({ "\n" }),
    t("    GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE ,@errno = MYSQL_ERRNO ,@text = MESSAGE_TEXT;"),
    t({ "\n" }),
    t("    SET @message = SUBSTRING(CONCAT('"),
    i(1),
    t(" > ' ,@text) ,1 ,128);"),
    t({ "\n" }),
    t("    SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = @errno ,MESSAGE_TEXT = @message;"),
    t({ "\n" }),
    t("  END;"),
    t({ "\n" }),
    i(0)
  }),
  s("function", {
    t("FUNCTION ")
  }),
  s("ondeleterestrict", {
    t("ON DELETE RESTRICT ")
  }),
  s("onupdaterestrict", {
    t("ON UPDATE RESTRICT ")
  }),
  s("deterministic", {
    t("DETERMINISTIC ")
  }),
  s("return", {
    t("RETURN ")
  }),
  s("returns", {
    t("RETURNS ")
  }),
  s("trigger", {
    t("TRIGGER ")
  }),
  s("createtriggerbeforeinsert", {
    t("CREATE TRIGGER "),
    i(0),
    t(" BEFORE INSERT ON goto_table_name FOR EACH ROW ")
  }),
  s("createtriggerbeforeupdate", {
    t("CREATE TRIGGER "),
    i(0),
    t(" BEFORE UPDATE ON goto_table_name FOR EACH ROW ")
  }),
  s("createtriggerbeforedelete", {
    t("CREATE TRIGGER "),
    i(0),
    t(" BEFORE DELETE ON goto_table_name FOR EACH ROW ")
  }),
  s("createtriggerafterinsert", {
    t("CREATE TRIGGER "),
    i(0),
    t(" AFTER INSERT ON goto_table_name FOR EACH ROW ")
  }),
  s("createtriggerafterupdate", {
    t("CREATE TRIGGER "),
    i(0),
    t(" AFTER UPDATE ON goto_table_name FOR EACH ROW ")
  }),
  s("createtriggerafterdelete", {
    t("CREATE TRIGGER "),
    i(0),
    t(" AFTER DELETE ON goto_table_name FOR EACH ROW ")
  }),
  s("before", {
    t("BEFORE ")
  }),
  s("after", {
    t("AFTER ")
  }),
  s("foreachrow", {
    t("FOR EACH ROW ")
  }),
  s("event", {
    t("EVENT ")
  }),
  s("schedule", {
    t("SCHEDULE ")
  }),
  s("at", {
    t("AT ")
  }),
  s("every", {
    t("EVERY ")
  }),
  s("do", {
    t("DO ")
  }),
  s("starts", {
    t("STARTS ")
  }),
  s("create event", {
    t("CREATE EVENT `"),
    i(1),
    t("` ON SCHEDULE EVERY 1 DAY STARTS "),
    i(2, "'2022-01-01 00:00:00'"),
    t(" DO "),
    i(0)
  }),
  s("case", {
    t("CASE ")
  }),
  s("when", {
    t("WHEN ")
  }),
  s("then", {
    t("THEN ")
  }),
  s("else", {
    t("ELSE ")
  }),
  s("end", {
    t("END")
  }),
  s("casewhenline", {
    t("CASE WHEN "),
    i(0),
    t(" THEN  ELSE  END")
  }),
  s("caseend", {
    t("CASE"),
    t({ "", "  WHEN " }), i(0), t(" THEN "),
    t({ "", "  ELSE " }),
    t({ "", "END" })
  }),
  s("if", {
    t("IF("),
    i(0),
    t(")")
  }),
  s("ifnull", {
    t("IFNULL("),
    i(0),
    t(")")
  }),
  s("elseif", {
    t("IF "), i(0), t(" THEN"),
    t({ "", "  " }),
    t({ "", "ELSEIF  THEN" }),
    t({ "", "  " }),
    t({ "", "ELSE " }),
    t({ "", "  " }),
    t({ "", "END IF;" })
  }),
  s("ifend", {
    t("IF "), i(0), t(" THEN"),
    t({ "", "  " }),
    t({ "", "END IF" })
  }),
  s("coalesce", {
    t("COALESCE("),
    i(0),
    t(")")
  }),
  s("showdatabases", {
    t("SHOW DATABASES")
  }),
  s("showtables", {
    t("SHOW TABLES ")
  }),
  s("showcolumns", {
    t("SHOW COLUMNS FROM ")
  }),
  s("showindexfrom", {
    t("SHOW INDEX FROM ")
  }),
  s("showvariables", {
    t("SHOW VARIABLES LIKE '%"),
    i(0),
    t("%'")
  }),
  s("showwarnings", {
    t("SHOW WARNINGS ")
  }),
  s("showcreatedatabase", {
    t("SHOW CREATE DATABASE ")
  }),
  s("showcreatetable", {
    t("SHOW CREATE TABLE ")
  }),
  s("showcreatetrigger", {
    t("SHOW CREATE TRIGGER ")
  }),
  s("showcreateprocedure", {
    t("SHOW CREATE PROCEDURE ")
  }),
  s("showcreatefunction", {
    t("SHOW CREATE FUNCTION ")
  }),
  s("memory", {
    t("MEMORY ")
  }),
  s("check", {
    t("CHECK ("),
    i(0),
    t(")")
  }),
  s("checkcase", {
    t("CHECK ("),
    t({ "", "  CASE" }),
    t({ "", "    WHEN " }), i(0), t(" THEN "),
    t({ "", "    ELSE " }),
    t({ "", "  END IS TRUE" }),
    t({ "", ")" })
  }),
  s("enum", {
    t("ENUM("), i(0), t(")")
  }),
  s("grant", {
    t("GRANT ")
  }),
  s("all", {
    t("ALL ")
  }),
  s("privileges", {
    t("PRIVILEGES ")
  }),
  s("flush", {
    t("FLUSH ")
  }),
  s("allprivileges", {
    t("ALL PRIVILEGES")
  }),
  s("flushprivileges", {
    t("FLUSH PRIVILEGES")
  }),
  s("optimize table", {
    t("OPTIMIZE TABLE ")
  }),
  s("columns", {
    t("COLUMNS ")
  }),
  s("path", {
    t("PATH '$"),
    i(0),
    t("' ERROR ON ERROR")
  }),
  s("with", {
    t("WITH ")
  }),
  s("with recursive", {
    t("WITH RECURSIVE "),
    i(1),
    t(" AS ("),
    t({ "\n" }),
    t("  -- root"),
    t({ "\n" }),
    t("  "),
    i(0),
    t({ "\n" }),
    t("  UNION ALL"),
    t({ "\n" }),
    t("  -- recursive"),
    t({ "\n" }),
    t("  "),
    t({ "\n" }),
    t(")")
  }),
  s("instr", {
    t("INSTR("), i(0), t(" ,)")
  }),
  s("set/", {
    t("/* "), i(0), t(" */")
  }),
  s("fd", {
    t("`"), i(0), t("`")
  }),
  s("pagernowrap", {
    t("pager grcat /config/.grcat | less -iMSx4FXR")
  }),
  s("pagerwrap", {
    t("pager grcat /config/.grcat | less -iMx4FXR")
  }),
  s("information_schema", {
    t("information_schema")
  }),
  s("information_schema.tables", {
    t("information_schema.TABLE ")
  }),
  s("information_schema.columns", {
    t("information_schema.COLUMNS")
  }),
  s("information_schema.triggers", {
    t("information_schema.TRIGGERS ")
  }),
  s("information_schema.routines", {
    t("information_schema.ROUTINES ")
  }),
  s("information_schema.views", {
    t("information_schema.VIEWS ")
  }),
  s("information_schema.keywords", {
    t("information_schema.KEYWORDS")
  }),
  s("table_schema", {
    t("TABLE_SCHEMA = '"), i(0), t("'")
  }),
  s("table_name", {
    t("TABLE_NAME = '"), i(0), t("'")
  }),
  s("column_name", {
    t("COLUMN_NAME = '"), i(0), t("'")
  }),
  s("explain", {
    t("EXPLAIN ")
  }),
  s("identifiedby", {
    t("IDENTIFIED BY '"), i(0), t("'")
  }),
  s("createroutine", {
    t("CREATE ROUTINE ")
  }),
  s("alterroutine", {
    t("ALTER ROUTINE ")
  }),
  s("tables", {
    t("TABLES")
  }),
  s("notspace", {
    t("NOT REGEXP_LIKE("), i(0), t(" ,'^[\\\\\\s　]+$' ,'c')")
  }),
  s("trimer", {
    t("AND REGEXP_LIKE("),
    i(0),
    t(" ,'^(?!.*(^[\\\\\\s　]+|[\\\\\\s　]+$)).{"),
    i(1),
    t(","),
    i(2),
    t("}$' ,'c')")
  }),
  s("stringchecktext", {
    t("AND REGEXP_LIKE("),
    i(0),
    t(" ,'^(?!.*(^[\\\\\\s　]+|[\\\\\\s　]+$)).{"),
    i(1),
    t(","),
    i(2),
    t("}$' ,'c')")
  }),
  s("stringcheckarea", {
    t("AND REGEXP_LIKE("),
    i(0),
    t(" ,'^(?!.*(^[\\\\\\s　]+$)).{"),
    i(1),
    t(","),
    i(2),
    t("}$' ,'c')")
  }),
  s("integer_range", {
    t("AND JSON_VALUE("),
    i(1, "in_"),
    t("jdoc ,'$."),
    i(2),
    t("' RETURNING UNSIGNED) BETWEEN 0 AND 1000"),
    i(0)
  }),
  s("organizejsonarray", {
    t("REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE("),
    i(0),
    t(
      " ,'\\\\\\\\\\\\\\\"' ,'#__q__#' ,1 ,0 ,'c') ,'^\\\\\\[|\\\\\\]$' ,'' ,1 ,0 ,'c') ,'\"' ,'' ,1 ,0 ,'c') ,'#__q__#' ,'\"' ,1 ,0 ,'c')")
  }),
  s("uuid", {
    t("UUID() ")
  }),
  s("uuid_short", {
    t("UUID_SHORT() ")
  }),
  s("commentline", {
    t("/*----------------------------------------------------------------*/")
  }),
  s("foreign_key_checks_off", {
    t("SET foreign_key_checks = 0;")
  }),
  s("foreign_key_checks_on", {
    t("SET foreign_key_checks = 1;")
  }),
  s("setregister", {
    t("/* register */"),
    t({ "", ",createUserId INT      NOT NULL" }),
    t({ "", ",createAt     DATETIME NOT NULL" }),
    t({ "", ",updateUserId INT      NOT NULL" }),
    t({ "", ",updateAt     DATETIME NOT NULL" }),
    t({ "", ",registerCd   CHAR(1) CHARACTER SET ascii NOT NULL" }),
    t({ "", ",registerMs   VARCHAR(255) NOT NULL" }),
    t({ "", "  ,CONSTRAINT chk_" }), i(1), t(
    "_register CHECK (CASE WHEN registerCd = 'c' THEN createAt = updateAt ELSE createAt != updateAt END IS TRUE)")
  }),
  s("setmeta", {
    t("/* meta */"),
    t({ "", ",metaTitle       VARCHAR(50)  NOT NULL DEFAULT ''" }),
    t({ "", ",metaDescription VARCHAR(120) NOT NULL DEFAULT ''" }),
    t({ "", ",metaNoIndex     TINYINT      NOT NULL DEFAULT 0" }),
    t({ "", ",metaNoFollow    TINYINT      NOT NULL DEFAULT 0" })
  }),
  s("setpublic", {
    t("/* public */"),
    t({ "\n" }),
    t(",publicStatusCd CHAR(7) CHARACTER SET ascii NOT NULL"),
    t({ "\n" }),
    t("  ,CONSTRAINT chk_"),
    i(1),
    t("_publicStatusCd CHECK (publicStatusCd IN ('draft' ,'preview' ,'publish' ,'private' ,'trash'))"),
    t({ "\n" }),
    t(",publicPublishedAt DATETIME"),
    t({ "\n" }),
    t("  ,CONSTRAINT chk_"),
    i(1),
    t("_publicPublishAt CHECK ("),
    t({ "\n" }),
    t("    CASE"),
    t({ "\n" }),
    t("      WHEN publicPublishedAt IS NULL THEN publicStatusCd != 'publish'"),
    t({ "\n" }),
    t("      ELSE TRUE"),
    t({ "\n" }),
    t("    END IS TRUE"),
    t({ "\n" }),
    t("  )"),
    t({ "\n" }),
    t(",publicModifiedAt DATETIME"),
    t({ "\n" }),
    t("  ,CONSTRAINT chk_"),
    i(1),
    t("_publicModifiedAt CHECK ("),
    t({ "\n" }),
    t("    CASE"),
    t({ "\n" }),
    t("      WHEN publicModifiedAt IS NULL THEN publicStatusCd != 'publish'"),
    t({ "\n" }),
    t("      ELSE TRUE"),
    t({ "\n" }),
    t("    END IS TRUE"),
    t({ "\n" }),
    t("  )")
  }),
  s("setarray", {
    t("DROP TABLE IF EXISTS "),
    i(1),
    t("_array;"),
    t({ "\n" }),
    t("CREATE TABLE "),
    i(1),
    t("_array("),
    t({ "\n" }),
    t("  "),
    i(1),
    t("Id INT NOT NULL"),
    t({ "\n" }),
    t("    ,CONSTRAINT ifk_"),
    i(1),
    t("_a_pid FOREIGN KEY ("),
    i(1),
    t("Id) REFERENCES "),
    i(1),
    t("("),
    i(1),
    t("Id) "),
    t({ "\n" }),
    t({ "\n" }),
    t("  ,updateUserId INT NOT NULL"),
    t({ "\n" }),
    t("  ,updateAt DATETIME NOT NULL"),
    t({ "\n" }),
    t({ "\n" }),
    t("  ,arrayCd CHAR(32) CHARACTER SET ascii NOT NULL "),
    t({ "\n" }),
    t("    ,CONSTRAINT chk_"),
    i(1),
    t("_a_arrayCd CHECK (arrayCd IN ('"),
    i(1),
    t("ThumbnailAy'))"),
    t({ "\n" }),
    t("  ,rid INT NOT NULL"),
    t({ "\n" }),
    t("  ,uuid VARCHAR(255) CHARACTER SET ascii GENERATED ALWAYS AS (CONCAT("),
    i(1),
    t("Id ,'_' ,arrayCd ,'_' ,rid)) STORED NOT NULL"),
    t({ "\n" }),
    t("    ,UNIQUE KEY (uuid)"),
    t({ "\n" }),
    t({ "\n" }),
    t("  ,svl VARCHAR(720)"),
    t({ "\n" }),
    t("  ,tvl LONGTEXT"),
    t({ "\n" }),
    t("  ,ivl INT"),
    t({ "\n" }),
    t({ "\n" }),
    t("  ,mediaId BIGINT"),
    t({ "\n" }),
    t("    ,CONSTRAINT ifk_"),
    i(1),
    t("_a_mediaId FOREIGN KEY (mediaId) REFERENCES media(mediaId)"),
    t({ "\n" }),
    t({ "\n" }),
    t("  /* value check */"),
    t({ "\n" }),
    t("  ,CONSTRAINT chk_"),
    i(1),
    t("_a_ThumbnailAy CHECK ("),
    t({ "\n" }),
    t("    CASE"),
    t({ "\n" }),
    t("      WHEN arrayCd = '"),
    i(1),
    t("ThumbnailAy' THEN ("),
    t({ "\n" }),
    t("        /* mediaId */"),
    t({ "\n" }),
    t("        mediaId IS NOT NULL "),
    t({ "\n" }),
    t("        /* mediaAlt */"),
    t({ "\n" }),
    t("        AND svl IS NOT NULL AND CHAR_LENGTH(svl) BETWEEN 0 AND 500"),
    t({ "\n" }),
    t("      )"),
    t({ "\n" }),
    t("      ELSE TRUE "),
    t({ "\n" }),
    t("    END IS TRUE"),
    t({ "\n" }),
    t("  )"),
    t({ "\n" }),
    t(")"),
    t({ "\n" }),
    t("ENGINE InnoDB "),
    t({ "\n" }),
    t("CHARACTER SET utf8mb4"),
    t({ "\n" }),
    t("COLLATE utf8mb4_general_ci"),
    t({ "\n" }),
    t(";")
  }),
  s("setoption", {
    t("DROP TABLE IF EXISTS "),
    i(1),
    t("_option;"),
    t({ "\n" }),
    t("CREATE TABLE "),
    i(1),
    t("_option("),
    t({ "\n" }),
    t("  "),
    i(1),
    t("Id INT NOT NULL"),
    t({ "\n" }),
    t("    ,CONSTRAINT ifk_"),
    i(1),
    t("_o_pid FOREIGN KEY ("),
    i(1),
    t("Id) REFERENCES "),
    i(1),
    t("("),
    i(1),
    t("Id)"),
    t({ "\n" }),
    t({ "\n" }),
    t("  ,createUserId INT NOT NULL"),
    t({ "\n" }),
    t("  ,createAt DATETIME NOT NULL"),
    t({ "\n" }),
    t("  ,updateUserId INT NOT NULL"),
    t({ "\n" }),
    t("  ,updateAt DATETIME NOT NULL"),
    t({ "\n" }),
    t("  ,registerCd CHAR(1) CHARACTER SET ascii NOT NULL"),
    t({ "\n" }),
    t("  ,registerMs VARCHAR(255) NOT NULL"),
    t({ "\n" }),
    t("    ,CONSTRAINT chk_"),
    i(1),
    t("_o_register CHECK (CASE WHEN registerCd = 'c' THEN createAt = updateAt ELSE createAt != updateAt END IS TRUE)"),
    t({ "\n" }),
    t({ "\n" }),
    t("  ,optionCd CHAR(32) CHARACTER SET ascii NOT NULL"),
    t({ "\n" }),
    t("  ,uuid VARCHAR(255) CHARACTER SET ascii GENERATED ALWAYS AS (CONCAT("),
    i(1),
    t("Id ,'_' ,optionCd)) STORED NOT NULL"),
    t({ "\n" }),
    t("    ,UNIQUE KEY (uuid)"),
    t({ "\n" }),
    t({ "\n" }),
    t("  ,svl VARCHAR(720)"),
    t({ "\n" }),
    t("  ,tvl LONGTEXT"),
    t({ "\n" }),
    t("  ,ivl INT"),
    t({ "\n" }),
    t(")"),
    t({ "\n" }),
    t("ENGINE InnoDB "),
    t({ "\n" }),
    t("CHARACTER SET utf8mb4"),
    t({ "\n" }),
    t("COLLATE utf8mb4_general_ci"),
    t({ "\n" }),
    t(";")
  }),
  s("setlog", {
    t("DROP TABLE IF EXISTS "),
    i(1),
    t("_log;"),
    t({ "\n" }),
    t("CREATE TABLE "),
    i(1),
    t("_log("),
    t({ "\n" }),
    t("  logId BIGINT NOT NULL AUTO_INCREMENT  "),
    t({ "\n" }),
    t("    ,PRIMARY KEY (logId)"),
    t({ "\n" }),
    t({ "\n" }),
    t("  ,"),
    i(1),
    t("Id INT NOT NULL"),
    t({ "\n" }),
    t({ "\n" }),
    t("  ,createUserId INT      NOT NULL"),
    t({ "\n" }),
    t("  ,createAt     DATETIME NOT NULL"),
    t({ "\n" }),
    t("  ,updateUserId INT      NOT NULL"),
    t({ "\n" }),
    t("  ,updateAt     DATETIME NOT NULL"),
    t({ "\n" }),
    t("  ,registerCd   CHAR(1) CHARACTER SET ascii NOT NULL"),
    t({ "\n" }),
    t("  ,registerMs   VARCHAR(255) NOT NULL"),
    t({ "\n" }),
    t({ "\n" }),
    t("  ,publicPublishedAt DATETIME "),
    t({ "\n" }),
    t("  ,publicModifiedAt  DATETIME "),
    t({ "\n" }),
    t({ "\n" }),
    t("  ,jdoc JSON NOT NULL"),
    t({ "\n" }),
    t(")"),
    t({ "\n" }),
    t("ENGINE InnoDB "),
    t({ "\n" }),
    t("CHARACTER SET utf8mb4"),
    t({ "\n" }),
    t("COLLATE utf8mb4_general_ci"),
    t({ "\n" }),
    t(";")
  }),
  s("settmp", {
    t("DROP TABLE IF EXISTS "),
    i(1),
    t("_tmp;"),
    t({ "\n" }),
    t("CREATE TABLE "),
    i(1),
    t("_tmp ("),
    t({ "\n" }),
    t("  "),
    i(1),
    t("Id INT NOT NULL "),
    t({ "\n" }),
    t("    ,UNIQUE KEY ("),
    i(1),
    t("Id)"),
    t({ "\n" }),
    t("    ,CONSTRAINT ifk_"),
    i(1),
    t("_tmp_pid FOREIGN KEY ("),
    i(1),
    t("Id) REFERENCES "),
    i(1),
    t("("),
    i(1),
    t("Id)"),
    t({ "\n" }),
    t("  ,jdoc      JSON     NOT NULL"),
    t({ "\n" }),
    t("  ,tmpUserId INT      NOT NULL"),
    t({ "\n" }),
    t("  ,tmpAt     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"),
    t({ "\n" }),
    t(")"),
    t({ "\n" }),
    t("ENGINE InnoDB "),
    t({ "\n" }),
    t("CHARACTER SET utf8mb4"),
    t({ "\n" }),
    t("COLLATE utf8mb4_general_ci"),
    t({ "\n" }),
    t(";")
  }),
  s("setforeignkey", {
    t(",CONSTRAINT ifk_"),
    i(1),
    t("_"),
    i(2),
    t(" FOREIGN KEY ("),
    i(2),
    t(") REFERENCES "),
    i(3),
    t("("),
    i(2),
    i(0),
    t(")")
  }),
  s("setcheck", {
    t(",CONSTRAINT chk_"),
    i(1),
    t("_"),
    i(2),
    t(" CHECK ("),
    i(0),
    t(")")
  }),
  s("setcharrange", {
    t("CASE"),
    t({ "\n" }),
    t("  WHEN "),
    i(1),
    t(" IS NOT THEN publicStatusCd != 'publish'"),
    i(0),
    t({ "\n" }),
    t("  WHEN CHAR_LENGTH("),
    i(1),
    t(") BETWEEN 0 AND "),
    i(3),
    t(" THEN CHAR_LENGTH("),
    i(1),
    t(") > 0 OR publicStatusCd != 'publish'"),
    t({ "\n" }),
    t("  ELSE FALSE "),
    t({ "\n" }),
    t("END IS TRUE")
  })
}
