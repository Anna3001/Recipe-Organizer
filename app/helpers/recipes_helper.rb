module RecipesHelper
  def display_author_for_recipe(recipe)
    if (author = @recipe_authors[recipe.user_id])
      email_parts = author.email.split('@')
      email_parts.first if email_parts.length > 1
    else
      'Author not available'
    end
  end
end
