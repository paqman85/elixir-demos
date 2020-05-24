defmodule AlchemyMarkdownTest do
  use ExUnit.Case
  doctest AlchemyMarkdown

  test "italicise" do
    str="Something *important*"
    assert AlchemyMarkdown.to_html(str) =~ "<em>important</em>"
  end

  test "expands big tags" do
    str = "Some ++big++ words!"
    assert AlchemyMarkdown.to_html(str) =~ "<big>big</big>"
  end

  test "expands small tags" do
    str= "Some --small-- tags"
    assert AlchemyMarkdown.to_html(str) =~ "<small>small</small>"
  end

  test "expands hr tags" do
    str1= "Stuff over the line\n---"
    str2= "Stuff over the line\n***"
    str3= "Stuff over the line\n-   -   -"
    str4= "Stuff over the line\n*     *     *"
    str5= "Stuff over the line*     *     *"

    Enum.each([str1, str2, str3, str4], fn str ->
      assert AlchemyMarkdown.to_html(str) =~ "\n<hr />"
    end)

    assert AlchemyMarkdown.hrs(str5) == str5
  end
end
