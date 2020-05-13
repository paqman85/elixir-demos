defmodule ImageSnatcher do
    # Find image in current directory
    # Creates a Sub-directory and moves the images into it
    
    def start() do
        
        is_image()
    end
    
    def is_image() do
        
        image_files = Path.wildcard( "*.jp*g")
        Enum.map(image_files, fn x -> move_image(x) end)
    end

    def move_image(img) do
        File.rename!(img, ~s(images/#{img}))
        IO.puts ~s(I moved "#{img} to image folder")
    end
end