package repositories;

import models.Category;

public class CategoryManager extends GenericRepositoryManager<Category> {
	public CategoryManager() {
		super(Category.class);
	}
}
