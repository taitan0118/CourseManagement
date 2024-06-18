package org.course.management.repository;import jakarta.persistence.Id;import org.course.management.entity.User;import org.springframework.data.jpa.repository.JpaRepository;import org.springframework.data.jpa.repository.Query;import org.springframework.data.repository.query.Param;public interface UserRepository extends JpaRepository<User, Integer> {    @Query("SELECT u FROM User u WHERE u.username LIKE?1")    User findByUsername(@Param("username") String username);    User findById(int id);}