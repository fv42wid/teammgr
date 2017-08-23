<template>
    <v-alert error dismissible @input="onClose" :value="true">
        {{ error }}
    </v-alert>
</template>

<script>
    module.exports = {
        data: function() {
            return {

            }
        },
        methods: {
            onClose() {
                this.$emit('alertdismissed')
            }
        },
        props: ['error'],
        created: function() {
            console.log('alert created')
            console.log(error)
        }
    }
</script>