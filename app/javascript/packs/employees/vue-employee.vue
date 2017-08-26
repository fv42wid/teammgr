<template>
    <v-layout row>
        <v-flex xs12 sm6 offset-sm3>
            <v-card class="mb-2">
                <v-card-title primary-title>
                    <div>
                        <h5>{{ employee.fname }} {{ employee.lname }}</h5>
                        <div>{{ employee.position }}</div>
                    </div>
                </v-card-title>
                <v-card-actions>
                    <v-btn flat class="orange--text" @click="createAssignment()">Create Assignment</v-btn>
                    <v-btn flat class="orange--text" @click="showAssignments = !showAssignments">Show Assignments</v-btn>
                </v-card-actions>
                <v-card-text v-if="creatingAssignment">
                    <h6>Create Assignment</h6>
                    <new-assignment :employee="employee.id" @addAssignment="addAssignment"></new-assignment>
                </v-card-text>
                <v-card-text v-if="showAssignments">
                    <v-list two-line>
                        <v-list-tile avatar ripple v-for="(assignment, index) in assignments" :key="index">
                            <v-list-tile-content>
                                <v-list-tile-title class="primary--text">{{ assignment.project }}</v-list-tile-title>
                                <v-list-tile-sub-title class="grey--text">
                                    {{ assignment.start_date | formatDate }} to {{ assignment.end_date| formatDate }}
                                </v-list-tile-sub-title>
                                <v-list-tile-sub-title>
                                    {{ assignment.allocation_percentage }}% - {{ assignment.project_frequency }}
                                </v-list-tile-sub-title>
                            </v-list-tile-content>
                            <v-list-tile-action>
                                <v-icon class="grey--text text--lighten-1">create</v-icon>
                            </v-list-tile-action>
                        </v-list-tile>
                    </v-list>
                </v-card-text>
            </v-card>
        </v-flex>
    </v-layout>
</template>

<script>
    import AssignmentNew from '../assignments/vue-assignment-new.vue'

    export default {
        data: function() {
            return {
                employee: JSON.parse(this.card),
                assignments: JSON.parse(this.empassignments),
                creatingAssignment: false,
                showAssignments: false
            }
        },
        props: ['card', 'empassignments'],
        mounted() {
            console.log(this.employee + ' created')
            console.log(this.assignments)
        },
        methods: {
            createAssignment() {
                console.log('create assignment')
                this.creatingAssignment = !this.creatingAssignment
            },
            addAssignment(assignment) {
                this.assignments.push(assignment)
                this.creatingAssignment = false
            }
        },
        components: {
            'new-assignment' : AssignmentNew
        },
        filters: {
            formatDate: function(date) {
                return date.slice(0, 10)
            }
        }
    }
</script>