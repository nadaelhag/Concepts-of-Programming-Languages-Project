public class MergeSort {
	// Number of comparisons between elements
	private static int comparisons = 0;
	
	// Merge sort algorithm 
	public static int[] mergeSort(int[] array) {
		int x = array.length;
		// Base case: if array size is 1 or 0 then array is already sorted
		if (x <= 1) {
			// Return the array given
			return array;
		}
		else {
			// Calculate the middle index
			int mid = x / 2;
			
			// Create left and right arrays
			int[] leftArray = new int[mid]; // 0 to mid-1
			int[] rightArray = new int[x - mid]; // mid to x-1

			// Copying elements to left array
			for (int i = 0; i < mid; i++) {
				leftArray[i] = array[i];
			}
			
			// Copying elements to right array
			for (int i = mid; i < x; i++) {
				rightArray[i - mid] = array[i];
			}

			// Print the elements copied into the left and right sub arrays after dividing
			// Continue dividing until each sub array contains one element (base case has been reached)
			System.out.println("The subarrays - dividing:");
			
			System.out.print("Left: ");
			display(leftArray);

			System.out.print("Right: ");
			display(rightArray);
			System.out.println();
			
			// Recursively sort the left and right arrays
			mergeSort(leftArray);
			mergeSort(rightArray);

			// Merge the sorted arrays
		    // This is the conquer phase
			return merge(array, leftArray, rightArray);
		}
	}

	// Method to merge two sorted arrays
	public static int[] merge(int[] array, int[] left, int[] right) {
		int i = 0; // Current position in the left array
		int j = 0; // Current position in the right array
		int k = 0; // Current position in our final sorted array
		
		// Merge left and right arrays into array
		while (i < left.length && j < right.length) {
			comparisons++; // Counting comparisons
			/* k is the index of the element in the final sorted array
			   when j and i are accessed, the elements stored at those indices are copied into our array
			   at index k */
			if (left[i] <= right[j]) {
				array[k++] = left[i++];
			} else {
				array[k++] = right[j++];
			}
		}
		
		// Copy remaining elements of left array
		while (i < left.length) {
			array[k++] = left[i++];
		}
		
		// Copy remaining elements of right array
		while (j < right.length) {
			array[k++] = right[j++];
		}
		System.out.println("Sorted Subarray - merging:");
		display(array);
		System.out.println();
		return array;
	}

	// Main method
	public static void main(String[] args) {
		// Example array
		int[] array = {1430, 3292, 7684, 1338, 193, 595, 4243, 9002, 4393, 130};
		
		System.out.println("Original array:");
		// Display original array
		display(array);
		System.out.println();
		
		// Sort the array
		mergeSort(array);
		
		// Print number of comparisons
		System.out.println("Number of Comparisons: " + comparisons);
		System.out.println();
		
		System.out.println("Sorted array:");
		// Display sorted array
		display(array);
	}

	// Method to display elements of an array
	private static void display(int[] array) {
		// For each loop used to iterate through every element of the array and print it
		for (int i : array) {
			System.out.print(i + " ");
		}
		System.out.println();
	}
}
