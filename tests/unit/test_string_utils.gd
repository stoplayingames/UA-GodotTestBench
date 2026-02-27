extends GutTest

const StringUtilsRef = preload("res://src/string_utils.gd")


func test_reverse_text_reverses_standard_text() -> void:
	# Arrange
	var value := "Godot"

	# Act
	var result := StringUtilsRef.reverse_text(value)

	# Assert
	assert_eq(result, "todoG", "reverse_text should reverse character order.")


func test_reverse_text_returns_empty_for_empty_input() -> void:
	# Arrange
	var value := ""

	# Act
	var result := StringUtilsRef.reverse_text(value)

	# Assert
	assert_eq(result, "", "reverse_text should keep empty input unchanged.")


func test_slugify_normalizes_case_whitespace_and_spacing() -> void:
	# Arrange
	var value := "  Hello   Godot TestBench  "

	# Act
	var result := StringUtilsRef.slugify(value)

	# Assert
	assert_eq(result, "hello-godot-testbench", "slugify should trim/lowercase/collapse spaces.")
