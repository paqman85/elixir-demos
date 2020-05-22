defmodule MiniMarkdown do
    def to_html(text) do
        text
            |> p
            |> bold
            |> italics
            |> big
            |> small
            

    end


    def bold(text) do
        Regex.replace(~r/\*\*(.*)\*\*/, text, "<strong>\\1</strong>")
    end

    def italics(text) do
        Regex.replace(~r/\*(.*)\*/, text, "<em>\\1</em>")
    end

    def big(text) do
        Regex.replace(~r/\+\+(.*)\+\+/, text, "<big>\\1</big>")
    end

    def small(text) do
        Regex.replace(~r/\-\-(.*)\-\-/, text, "<small>\\1</small>")
    end

    def p(text) do
        Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)+$)?/, text, "<p>\\2</p>")
    end

    def test_str do
        """
        I *so loved* programming in --python--, but ++Elixir++ is **Amazing!**

        What fun!
        """
    end
end