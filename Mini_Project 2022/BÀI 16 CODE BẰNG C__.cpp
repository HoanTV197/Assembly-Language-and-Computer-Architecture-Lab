BÀI 16-GIƯA KÌ CODE BẰNG NGÔN NGỮ C++

#include <bits/stdc++.h>
using namespace std;

// Chức năng để tìm nếu nó có thể
// để làm cho mảng tăng nghiêm ngặt
// bằng cách loại bỏ nhiều nhất một phần tử
bool check(int arr[], int n)
{
	// Lưu trữ số lượng các số
// cần được gỡ bỏ
	int count = 0;

	// Lưu trữ chỉ mục của phần tử
// cần được xóa
	int index = -1;

	// Duyệt qua phạm vi [1, N - 1]
	for (int i = 1; i < n; i++) {

		// Nếu arr [i-1] lớn hơn hoặc bằng arr [i]
		if (arr[i - 1] >= arr[i]) {

			// Tăng số đếm lên 1
			count++;

			// Cập nhật chỉ mục
			index = i;
		}
	}

	// Nếu số lượng lớn hơn một
	if (count > 1)
		return false;

	//Nếu không có phần tử nào bị xóa
	if (count == 0)
		return true;

	// Nếu chỉ cuối cùng hoặc
// phần tử đầu tiên bị xóa
	if (index == n - 1 || index == 1)
		return true;

	// Nếu một [chỉ mục] bị xóa
	if (arr[index - 1] < arr[index + 1])
		return true;

	// Nếu [chỉ mục - 1] bị xóa
	if (index - 2 >= 0 && arr[index - 2] < arr[index])
		return true;
		
	// nếu không có yếu tố nào để so sánh
	if(index < 0)
		return true;

	return false;
}

int main()
{
	int arr[] = { 1, 2, 5, 3, 5 };
	int N = sizeof(arr) / sizeof(arr[0]);
	if (check(arr, N))
		cout << "Yes";
	else
		cout << "No";

	return 0;
}
