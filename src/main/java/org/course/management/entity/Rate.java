package org.course.management.entity;import com.fasterxml.jackson.annotation.JsonIgnoreProperties;import jakarta.persistence.*;import lombok.AllArgsConstructor;import lombok.Getter;import lombok.NoArgsConstructor;import lombok.Setter;@Getter@Setter@AllArgsConstructor@NoArgsConstructor@Entity@Table(name = "cm_rate")public class Rate {    @Id    @GeneratedValue(strategy = GenerationType.IDENTITY)    @Column(name = "rate_id")    private int rateId;    @Column(name = "stars")    private int stars;    @Column(name = "comment", columnDefinition = "nvarchar(255)")    private String comment;    @Column(name = "date_comment", columnDefinition = "nvarchar(255)")    private String dateComment;    @Column(name = "is_comment")    private boolean isComment;    @ManyToOne(fetch = FetchType.LAZY)    @JoinColumn(name = "user_id")    @JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})    private User user;    @ManyToOne(fetch = FetchType.LAZY)    @JoinColumn(name = "course_id")    @JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})    private Course course;    @ManyToOne(fetch = FetchType.LAZY)    @JoinColumn(name = "enroll_id")    @JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})    private Enroll enroll;}