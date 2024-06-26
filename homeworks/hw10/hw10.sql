CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT a.child from parents AS a, dogs as b WHERE b.name = a.parent ORDER BY -(b.height);


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT a.name AS NAMEE, b.size AS SIZESS FROM dogs AS a, sizes AS b WHERE a.height > b.min AND a.height <= b.max;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child AS first, b.child AS second, c.SIZESS AS sizeee, d.SIZESS FROM parents AS a, parents AS b, size_of_dogs AS c, size_of_dogs AS d 
  WHERE a.parent = b.parent AND a.child < b.child AND a.child = c.NAMEE AND b.child = d.NAMEE AND c.SIZESS = d.SIZESS ORDER BY second;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || first || " and " || second || ", have the same size: " || sizeee FROM siblings;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, MAX(height) - MIN(height) FROM dogs 
  GROUP BY fur having MIN(height) > 0.7*(AVG(height)) AND MAX(height) < 1.3*(AVG(height));

