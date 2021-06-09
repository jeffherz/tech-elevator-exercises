<template>
  <div class="card" v-bind:class="{read:book.read}">
    <!-- put the h2 with book title -->
    <h2 class="book-title">{{ book.title }}</h2>
    <!-- <h2 v-for="book in " v-bind:key="book.isbn"></h2>  no clue what I am doing -->
    <img v-if="book.isbn" v-bind:src="'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'" />
    <!-- put the h3 with the author -->
    <h3 class="book-author">{{ book.author }}</h3>
    <!-- add a button to mark it read/unread                                  -->
    <!--      needs to say read / unread depending on current read status     -->
    <!--               a class needs to be added depending on read status     -->
    <!--            if current status is read, the button should say "unread" -->
    <!--            if current status is unread, the button should say "read" -->
    <!-- if the book statusis read, it needs class read added to the div -->
    <!-- Because book properties are in Vuex Data Store, we need a mutation to -->
    <!--      set the read status                                              -->
    <button class="mark-read" v-on:click.prevent="setRead(true)" v-if="!book.read">Mark Read</button>
    <button class="mark-unread" v-on:click.prevent="setRead(false)" v-if="book.read">Mark Unread</button>
  </div>
</template>

<script>
export default {
    name: 'book-card',
    props: {             // datta whose values come from outside this component
        book : Object    // we are going get an object called book
    },
    methods: {
        setRead(value) {
            this.$store.commit('SET_READ_STATUS'), {book: this.book, value: value}
        }
    }
}
</script>

<style>
.card {
    border: 2px solid black;
    border-radius: 10px;
    width: 250px;
    height: 550px;
    margin: 20px;
}

.card.read {
    background-color: lightgray;
}

.card .book-title {
    font-size: 1.5rem;
}

.card .book-author {
    font-size: 1rem;
}
</style>