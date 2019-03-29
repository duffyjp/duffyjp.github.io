---
layout: post
title: "Display Image in Terminal (with Ruby)"
---

[https://github.com/duffyjp/barf](https://github.com/duffyjp/barf)

Installation
```bash
gem install barf
```

Usage
```bash
$ barf image.jpg
```

![example](/assets/img/barf.gif){:width="50%"}

## It's not too complicated 
* Uses FloydSteinberg dithering (error diffusion) to maximize the quality.
* Applies the ANSI color palette with MiniMagick before using tco's color matching.
* Uses unicode "Lower Half Block" to essentially get two "pixels" per character.
* Ruby is great, but this is slow.  I'm using Parallel to use all CPU cores.

https://github.com/duffyjp/barf/blob/master/lib/barf.rb
```ruby
def self.print(path)
  image = MiniMagick::Image.open(path)

  terminal_width = `tput cols`.to_i

  # Height must be divisible by 2 for the half pixels to be clean.
  new_height = [2, (image.height * (0.5 * terminal_width / image.width)).to_i * 2].max

  image.combine_options do |tmp|
    tmp.alpha 'remove'
    tmp.flatten
    tmp.resize "#{terminal_width}x#{new_height}!"
    tmp.dither 'FloydSteinberg'
    tmp.remap __dir__ + '/palette.png'
  end

  # Two dimensional array of pixels:
  image.get_pixels.each_slice(2) do |top, bottom|
    out = Parallel.map_with_index(top) do |pixel, index|
      "\u2584".bg(pixel).fg(bottom[index])
    end.join
    puts out
  end
  return nil
end
```