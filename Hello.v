Require Import Options.

Require Import Coq.micromega.Lia.

(*
  This page contains some example proofs.
  Replace it with your project's files.
*)

Example subtract_one : forall n,
  n > 0 ->
  n - 1 <> n.
Proof.

induction n; lia.

Qed.

Lemma even_plus_two : forall n,
  Nat.even n = true ->
  Nat.even (n + 2) = true.
Proof.

induction n; simpl; try reflexivity.

destruct n as [| n'].
1: intros Hf; inversion Hf.

intros.
replace (S n' + 2) with (S (S (S n'))) by lia.

simpl.
assumption.

Qed.

Example two_n_always_even : forall n,
  Nat.even (2*n) = true.
Proof.

induction n; simpl; try reflexivity.
replace (n + S (n + 0)) with (S (2*n)) by lia.
assumption.

Qed.

Example even_plus_one_is_odd : forall n,
  Nat.even n = true ->
  Nat.odd (n + 1) = true.
Proof.

intros.

unfold Nat.odd.
apply Bool.negb_true_iff.

destruct (DecidableTypeEx.Nat_as_DT.eq_dec n 0); subst; try solve [simpl; auto].
destruct (DecidableTypeEx.Nat_as_DT.eq_dec n 1); subst; try solve [simpl; auto].
destruct (DecidableTypeEx.Nat_as_DT.eq_dec n 2); subst; try solve [simpl; auto].

assert (Nat.even (n - 1) = false). {
  assert (exists k, S k = n). { exists (n-1). lia. }
  destruct H0 as [k Hk].
  replace (n-1) with k by lia. subst n.

  destruct (Sumbool.sumbool_of_bool (Nat.even k)); auto.
  exfalso.

  induction k.
  1: { simpl in *; inversion H. }
  destruct (DecidableTypeEx.Nat_as_DT.eq_dec k 1); subst; try solve [simpl; auto].
  simpl in *. inversion H.
}

replace (n + 1) with (S (S (n - 1))) by lia.
simpl.
assumption.

Qed.

Lemma not_both_even_and_odd : forall n,
  ~ (Nat.even n = true /\ Nat.odd n = true).
Proof.

intros. unfold not; intros Hf. destruct Hf.
unfold Nat.odd in H0.
apply Bool.negb_true_iff in H0.
rewrite H in H0.
inversion H0.

Qed.