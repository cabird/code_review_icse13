import re

p = re.compile(r"/|\(")

buckets = {}

for line in open("survey_developers.tsv").readlines()[1:]:
	parts=line.split("\t")
	field = parts[8]
	categories = field.split(";#")
	for category in categories:
		category = category.replace('"', '')
		name = p.split(category)[0]
		print name
		if not name in buckets.keys():
			buckets[name] = [0, 0, 0]
		if "First" in category:
			buckets[name][0] += 1;
		if "Second" in category:
			buckets[name][1] += 1;
		if "Third" in category:
			buckets[name][2] += 1;

fd = open("dev_motivations.tsv", "w")
for k, v in buckets.items():
	print >> fd, k + "\t" + str(v[0]) + "\t" + str(v[1]) + "\t" + str(v[2])
	print k + "\t" + str(v[0]) + "\t" + str(v[1]) + "\t" + str(v[2])


