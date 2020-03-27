BEGIN;

CREATE TABLE users (
	user_id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
	user_name TEXT NOT NULL,
	password TEXT NOT NULL,
	full_name TEXT NOT NULL
);

CREATE TABLE recipes (
	recipe_id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
	user_id INTEGER REFERENCES users (user_id) NOT NULL,
	title TEXT NOT NULL,
	recipe_description TEXT,
	instructions TEXT NOT NULL
);

CREATE TABLE ingredients (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  ingredient_name TEXT NOT NULL
);

CREATE TABLE measurements (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  measurement_name TEXT NOT NULL
);

CREATE TABLE recipeingredients (
  recipe_id INTEGER REFERENCES recipes (recipe_id),
  ingredient_id INTEGER REFERENCES ingredients (id),
  measure_id INTEGER REFERENCES measurements (id),
  quantity INTEGER NOT NULL
);

COMMIT;