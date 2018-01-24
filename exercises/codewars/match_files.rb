# Are you a file extension master? Let's find out by checking if Bill's files 
# are images or audio files. Please use regex if available natively for your 
# language.

# You will create 2 string methods:

# isAudio/is_audio, matching 1 or + uppercase/lowercase letter(s) 
# (combination possible), with the extension .mp3, .flac, .alac, or .aac.

# isImage/is_image, matching 1 or + uppercase/lowercase letter(s) 
# (combination possible), with the extension .jpg, .jpeg, .png, .bmp, or .gif.

# Note that this is not a generic image/audio files checker. 
# It's meant to be a test for Bill's files only. Bill doesn't like punctuation. 
# He doesn't like numbers, neither. Thus, his filenames are letter-only

# Rules
# It should return true or false, simply.
# File extensions should consist of lowercase letters and numbers only.
# File names should consist of letters only (uppercase, lowercase, or both)
# Good luck!

# check if Bill's files are images or audio files
# 2 methods
# is_audio
#   matching 1 or + uppercase/lowercase letters
#   with the extension .mp3, .flac, .alac, .aac

# is_image
#   1 or + uppercase/lowercase letters
#   extension .jpg, .jped, .png, .bmp, or .gif

# input
#  string - filename
# output
#   boolean, whether or not a file is an audio file or not

# given a string, match the string using #match?
def is_audio(str)
  str.match(/\A\w*.(mp3|flac|alac|aac)\Z/) != nil
end

def is_image(str)
  str.match(/\A\w*.(jpg|jpeg|png|bmp|gif)\Z/) != nil
end