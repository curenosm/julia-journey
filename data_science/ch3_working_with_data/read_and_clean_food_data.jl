# Dataset: borapajo/food-choices

using CSV
using DataFrames
using JLD2
using MLLabelUtils
using Query
using Random
using StatsBase

include("chp3_functions.jl")
Random.seed!(24_908)

## Tipos para las columnas del archivo
IntOrMiss = Union{Int64,Missing}
FltOrMiss = Union{Float64,Missing}
StrOrMiss = Union{String,Missing}

# Definimos los nombres de variable para cada columna
food_header = [
  "gpa", "gender", "breakfast", "cal_ckn", "cal_day",
  "cal_scone", "coffee", "comfort_food", "comfort_food_reason",
  "comfoodr_code1", "cook", "comfoodr_code2", "cuisine", "diet_current",
  "diet_current_code", "drink", "eating_changes", "eating_changes_coded",
  "eating_changes_coded1", "eating_out", "employment", "ethnic_food",
  "exercise", "father_educ", "father_prof", "fav_cuisine",
  "fav_cuisine_code", "fav_food", "food_child", "fries", "fruit_day",
  "grade_level", "greek_food", "healthy_feeling", "healthy_meal",
  "ideal_diet", "ideal_diet_coded", "income", "indian_food",
  "italian_food", "life_reward", "marital_status", "meals_friend",
  "mom_educ", "mom_prof", "nut_check", "on_campus", "parents_cook",
  "pay_meal_out", "persian_food", "self_perception_wgt", "soup", "sports",
  "thai_food", "tortilla_cal", "turkey_cal", "sports_type", "veggies_day",
  "vitamins", "waffle_cal", "wgt"]

## Diccionario de tipos para cada columna
food_types = Dict{String,Union}(
  "gpa" => FltOrMiss,
  "gender" => IntOrMiss,
  "breakfast" => IntOrMiss,
  "cal_ckn" => IntOrMiss,
  "cal_day" => IntOrMiss,
  "cal_scone" => IntOrMiss,
  "coffee" => IntOrMiss,
  "comfort_food" => StrOrMiss,
  "comfort_food_reason" => StrOrMiss,
  "comfoodr_code1" => IntOrMiss,
  "cook" => IntOrMiss,
  "comfoodr_code2" => IntOrMiss,
  "cuisine" => IntOrMiss,
  "diet_current" => StrOrMiss,
  "diet_current_code" => IntOrMiss,
  "drink" => IntOrMiss,
  "eating_changes" => StrOrMiss,
  "eating_changes_coded" => IntOrMiss,
  "eating_changes_coded1" => IntOrMiss,
  "eating_out" => IntOrMiss,
  "employment" => IntOrMiss,
  "ethnic_food" => IntOrMiss,
  "exercise" => IntOrMiss,
  "father_educ" => IntOrMiss,
  "father_prof" => StrOrMiss,
  "fav_cuisine" => StrOrMiss,
  "fav_cuisine_code" => IntOrMiss,
  "fav_food" => IntOrMiss,
  "food_child" => StrOrMiss,
  "fries" => IntOrMiss,
  "fruit_day" => IntOrMiss,
  "grade_level" => IntOrMiss,
  "greek_food" => IntOrMiss,
  "healthy_feeling" => IntOrMiss,
  "healthy_meal" => StrOrMiss,
  "ideal_diet" => StrOrMiss,
  "ideal_diet_coded" => IntOrMiss,
  "income" => IntOrMiss,
  "indian_food" => IntOrMiss,
  "italian_food" => IntOrMiss,
  "life_reward" => IntOrMiss,
  "marital_status" => IntOrMiss,
  "meals_friend" => StrOrMiss,
  "mom_educ" => IntOrMiss,
  "mom_prof" => StrOrMiss,
  "nut_check" => IntOrMiss,
  "on_campus" => IntOrMiss,
  "parents_cook" => IntOrMiss,
  "pay_meal_out" => IntOrMiss,
  "persian_food" => IntOrMiss,
  "self_perception_wgt" => IntOrMiss,
  "soup" => IntOrMiss,
  "sports" => IntOrMiss,
  "thai_food" => IntOrMiss,
  "tortilla_cal" => IntOrMiss,
  "turkey_cal" => IntOrMiss,
  "sports_type" => StrOrMiss,
  "veggies_day" => IntOrMiss,
  "vitamins" => IntOrMiss,
  "waffle_cal" => IntOrMiss,
  "wgt" => FltOrMiss
)

## Leemos el CSV
df_food_raw = CSV.read("food_coded.csv",
  DataFrame;
  delim=',',
  quotechar='"',
  missingstring=["nan", "NA", "na", ""],
  header=food_header,
  types=food_types)

println(df_food_raw)

# Eliminando columnas del DataFrame
select!(df_food_raw, Not(:gpa))

# Eliminando filas del DataFrame
df = df_food_raw[setdiff(1:end, 3), :] # Borra la tercera fila

println(df_food_raw)
