# Amount of types
[int]$Amount = 2
# Pargraphs, words, bytes, or lists
[string]$Type = "pargraphs"
# Start with "Lorem ipsum dolor sit amet..."
[string]$Start = "yes"

# Execute web request
[xml]$Temp = Invoke-WebRequest -UseBasicParsing -Uri "http://www.lipsum.com/feed/xml?amount=$Amount&what=$Type&start=$Start"

# Show output
$Temp.feed.lipsum
