class_name StringUtils
extends RefCounted


static func reverse_text(value: String) -> String:
	var output := ""
	for i in range(value.length() - 1, -1, -1):
		output += value[i]
	return output


static func slugify(value: String) -> String:
	var normalized := value.strip_edges().to_lower().replace(" ", "-")
	while normalized.find("--") != -1:
		normalized = normalized.replace("--", "-")
	return normalized
