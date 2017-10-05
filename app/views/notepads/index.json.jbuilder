json.array!(@notepads) do |notepad|
  json.extract! notepad, :id, :name, :content_data, :user_id
  json.url notepad_url(notepad, format: :json)
end
