<template>
  <div class="book-container">
      <!-- add the BookCard component tag -->
      <!-- generate one BookCard tag for each book in the array -->
      <!-- the book array is in the Vue Data Store -->
      <book-card v-for="book in $store.state.books" 
                 v-bind:key="book.title" 
                 v-bind:book="book"></book-card>
  </div>
</template>

<script>
// import BookCard component vue file
    import BookCard from './BookCard.vue'
export default {
    name: 'reading-list',
    // add a component property to scepecify we are using the BookCard component
    components: {
      BookCard
    }
}
</script>

<style>
.book-container {
    display:flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}
</style>