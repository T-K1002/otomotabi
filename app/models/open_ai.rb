class OpenAi
  require 'ruby/openai'

  def self.generate_recommend(prefecture, genre, spots)
    client = OpenAI::Client.new(access_token: ENV["OPEN_AI_API_KEY"])
    response = client.chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        messages: [{ role: 'user', content: "#{spots}以外の、#{prefecture}で#{genre}が有名な旅行場所とその理由を3つ教えてください" }],
      }
    )
    response.dig('choices', 0, 'message', 'content')
  end
end
