extends GutTest

const MathUtilsRef = preload("res://src/math_utils.gd")


func test_add_returns_sum_for_positive_numbers() -> void:
	# Arrange
	var left := 2.5
	var right := 7.5

	# Act
	var result := MathUtilsRef.add(left, right)

	# Assert
	assert_eq(result, 10.0, "add should return the arithmetic sum.")


func test_add_supports_negative_values() -> void:
	# Arrange
	var left := -4.0
	var right := 1.5

	# Act
	var result := MathUtilsRef.add(left, right)

	# Assert
	assert_eq(result, -2.5, "add should handle negative inputs.")


func test_safe_divide_returns_zero_when_denominator_is_zero() -> void:
	# Arrange
	var numerator := 42.0
	var denominator := 0.0

	# Act
	var result := MathUtilsRef.safe_divide(numerator, denominator)

	# Assert
	assert_eq(result, 0.0, "safe_divide should guard divide-by-zero.")


func test_safe_divide_handles_near_zero_denominator_consistently() -> void:
	# Arrange
	var numerator := 10.0
	var denominator := 1e-12

	# Act
	var result := MathUtilsRef.safe_divide(numerator, denominator)

	# Assert
	if is_zero_approx(denominator):
		assert_eq(result, 0.0, "safe_divide should return zero for approx-zero denominator.")
	else:
		assert_eq(result, numerator / denominator, "safe_divide should divide normally when denominator is not approx zero.")
