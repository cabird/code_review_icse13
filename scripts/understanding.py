import re

p = re.compile(r"/|\(")

buckets = {}

for line in open("survey_developers.tsv").readlines()[1:]:
	parts=line.split("\t")
	field = parts[17]
	categories = field.split(";#")
	for category in categories:
		category = category.replace('"', '')
		name = p.split(category)[0].strip()
		if not name:
			continue
		#print name
		if not name in buckets.keys():
			buckets[name] = [0, 0, 0, 0]
		if "No understanding" in category:
			buckets[name][0] += 1;
		if "Little understanding" in category:
			buckets[name][1] += 1;
		if "High understanding" in category:
			buckets[name][2] += 1;
		if "Complete understanding" in category:
			buckets[name][3] += 1;

fd = open("understanding.tsv", "w")
for k, v in buckets.items():
	print >> fd, k + "\t" + str(v[0]) + "\t" + str(v[1]) + "\t" + str(v[2]) + "\t" + str(v[3])
	print k + "\t" + str(v[0]) + "\t" + str(v[1]) + "\t" + str(v[2]) + "\t" + str(v[3])


