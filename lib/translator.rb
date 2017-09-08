require 'yaml'

def load_library(file_path)
  original = YAML.load_file(file_path)
  get_emoticon = {}
  get_meaning = {}
  new_lib = {}
  original.each do |meaning, emojis|
    get_meaning[emojis.fetch(1)] = meaning
    get_emoticon[emojis.fetch(0)] = emojis[1]
  end
  new_lib["get_emoticon"] = get_emoticon
  new_lib["get_meaning"] = get_meaning
  new_lib
end

def get_japanese_emoticon(file_path, emoticon)
  new_lib = load_library(file_path)
  if new_lib.fetch("get_emoticon").keys.include?(emoticon)
    new_lib.fetch("get_emoticon").fetch(emoticon)
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  new_lib = load_library(file_path)
  if new_lib.fetch("get_meaning").keys.include?(emoticon)
    new_lib.fetch("get_meaning").fetch(emoticon)
  else
    "Sorry, that emoticon was not found"
  end
end
